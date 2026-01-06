# My Neovim Configuration

A modern, Lua-based Neovim configuration designed to be a lightweight yet powerful C/C++ development environment. It uses `lazy.nvim` for plugin management and is structured for easy maintenance and customization.

## Key Features

-   **IDE-Like Experience**: Provides modern development features like autocompletion, code diagnostics, and debugging thanks to native LSP (`lsp-config`), the Debug Adapter Protocol (`dap`), and linters/formatters via `none-ls`.
-   **Advanced Syntax Highlighting**: Leverages `tree-sitter` for faster and more accurate code parsing and highlighting.
-   **Efficient UI**: A clean and functional user interface featuring:
    -   A dashboard on startup (`alpha`).
    -   A file explorer (`neo-tree`).
    -   A sleek statusline (`lualine`) and bufferline.
    -   Helpful pop-up notifications (`notify`) and keybinding hints (`which-key`).
-   **Fast Workflow**:
    -   **Fuzzy Finding**: Quickly find files, text, and commands with `telescope`.
    -   **Session Management**: Automatically saves and restores your session with `persistence`.
    -   **Custom Keymaps**: Intuitive shortcuts for common actions, including window navigation and line moving.
-   **Special C++ Focus**:
    -   A dedicated **`<F5>`** keymap to instantly compile and run the current C++ file in a split terminal.

## Core Key Mappings

-   **Leader Key**: `<Space>`
-   **Window Navigation**: `Ctrl + h/j/k/l` to move between windows.
-   **File Explorer**: `<leader>e` to toggle the `neo-tree` file explorer.
-   **Fuzzy Finder**:
    -   `<leader>ff`: Find files.
    -   `<leader>fg`: Grep (live search) in files.
    -   `<leader>fb`: Browse buffers.
-   **Terminal**: `<leader>t` to toggle a floating terminal.
-   **C++ Compile & Run**: `<F5>`

## Main Plugins

-   **Plugin Manager**: `folke/lazy.nvim`
-   **UI**: `alpha-nvim`, `lualine.nvim`, `bufferline.nvim`, `neo-tree.nvim`, `rcarriga/nvim-notify`, `folke/which-key.nvim`.
-   **Editing & Workflow**: `telescope.nvim`, `folke/persistence.nvim`, `gitsigns.nvim`.
-   **Development**: `neovim/nvim-lspconfig`, `nvim-treesitter/nvim-treesitter`, `nvimtools/none-ls.nvim`, `mfussenegger/nvim-dap`, `piersolenski/cmake-tools.nvim`.
-   **Themes**: `rafi/awesome-vim-colorschemes`.

## Structure

The configuration is organized as follows:

-   `init.lua`: The main entry point. It bootstraps `lazy.nvim` and loads all other modules.
-   `lua/core/`: Contains the core editor settings (`config.lua`) and key mappings (`keymaps.lua`).
-   `lua/plugins/`: Each file in this directory configures a specific plugin or a group of related plugins. The `init.lua` in this folder simply loads all the other plugin files.
-   `after/`: For configurations that need to be loaded after other plugins, such as specific LSP server settings.
