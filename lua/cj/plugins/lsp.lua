return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},

		config = function()
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			local map = function(type, key, value)
				vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
			end

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"astro",
					"clangd",
					"cmake",
					"cssls",
					"eslint",
					"gopls",
					"html",
					"lua_ls",
					"markdown_oxide",
					"pylsp",
					"rust_analyzer",
					-- "spectral",
					"tailwindcss",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = function()
								map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
								map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
								map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
								map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
								map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
								map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
								map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
								map("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
								map("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
								map("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>")
								map("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>")
								map("n", "<leader>ee", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
								map("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>")
								map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
								map("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
								map("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")
							end,
						})
					end,

					zls = function()
						local lspconfig = require("lspconfig")
						lspconfig.zls.setup({
							root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
							settings = {
								zls = {
									enable_inlay_hints = true,
									enable_snippets = true,
									warn_style = true,
								},
							},
						})
						vim.g.zig_fmt_parse_errors = 0
						vim.g.zig_fmt_autosave = 0
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = { version = "Lua 5.1" },
									diagnostics = {
										globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
