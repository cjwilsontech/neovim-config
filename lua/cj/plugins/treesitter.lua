return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		init = function(plugin)
			--- Reference: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/treesitter.lua#L10
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = function()
			return {

				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = {
					"astro",
					"bash",
					"c",
					"cpp",
					"css",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"graphql",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"rust",
					"scss",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = { "yaml", "python", "html" } },
				rainbow = {
					enable = true,
					query = "rainbow-parens",
					disable = { "jsx", "html" },
				},
			}
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- Show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{ "<leader>tt", "<cmd>TSContextToggle<cr>", desc = "Toggle Treesitter Context" },
		},
	},
}
