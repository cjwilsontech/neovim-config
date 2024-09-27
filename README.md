# neovim-config

My personal neovim configuration, loosely based off of [ThePrimeagen's configuration](https://github.com/ThePrimeagen/init.lua).

## Installation

1. Clone this repo to the appropriate location for the platform:

- Linux: `~/.config/nvim`
- Mac: `~/.config/nvim`
- Windows: `~/AppData/Local/nvim/`

1. From neovim run `:Copilot setup` to set up GitHub Copilot.

1. Install the necessary dependencies. Scripts that include the necessary dependencies are provided for the following platforms:

- Arch Linux: `./install-arch.sh`

## Keymaps

[VIM Cheat Sheet](https://vim.rtorr.com/)

### General

- `<leader>pv` - Open file explorer view
- `<leader>f` - Format file
- `<C-o>` - Jump back
- `<C-i>` - Jump forward

### Telescope

- `<leader>ff` - Fuzzy find files
- `<leader>fg` - Fuzzy find text
- `<leader>fb` - Fuzzy find buffers
- `<leader>fh` - Fuzzy find help tags
- `<leader>fws` - Fuzzy find word
- `<C-p>` - Fuzzy find Git files

### Harpoon

- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon window
- `<leader>1` - Open Harpoon window 1
- `<leader>2` - Open Harpoon window 2
- `<leader>3` - Open Harpoon window 3
- `<leader>4` - Open Harpoon window 4
- `<leader>5` - Open Harpoon window 5

### LSP

- `<gD>` - Go to declaration
- `<gd>` - Go to definition
- `<K>` - Hover
- `<gr>` - Go to references
- `<gs>` - Signature help
- `<gi>` - Implementation
- `<gt>` - Type definition
- `<leader>gw` - Document symbol
- `<leader>gW` - Workspace symbol
- `<leader>af` - Code action
- `<leader>ah` - Hover
- `<leader>ar` - Rename
- `<leader>ai` - Incoming calls
- `<leader>ao` - Outgoing calls
- `<leader>ee` - Show diagnostics
- `<leader>=` - Format lines

### Fugitive

- `<leader>gs` - Git status

### Undotree

- `<leader>u` - Toggle undotree

### Copilot Chat

- `:CopilotChat <input>` - Send a message to Copilot
