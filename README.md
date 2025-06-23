# 💤 My Neovim Config

This is my personal Neovim configuration, optimized for speed, simplicity, and productivity.

It **uses the [`nvchad-ui`](https://github.com/NvChad/ui) plugin** for the visual style (statusline, tabline, theme),  
but it **does not use the full NvChad framework or its default configurations** — everything else is custom and minimal.

---

## ✨ Features

- 🚀 Fast startup with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 Modern UI using NvChad's UI plugin
- 🧠 Built-in LSP support with autocompletion and diagnostics
- 🔍 Fuzzy finding and file navigation via Telescope
- 🌈 Rich syntax highlighting and code parsing with Treesitter
- 🪄 Minimal, fast, and easy to maintain

---

## 📁 Folder Structure

```bash
~/.config/nvim
├── init.lua               # Main entry point
└── lua/
    ├── configs/           # Plugin configurations
    ├── plugins/           # Plugin spec tables for lazy.nvim
    │   └── init.lua
    ├── autocmds.lua       # Autocommands
    ├── chadrc.lua         # NvChad UI configuration
    ├── code_runner.lua    # Code runner setup
    ├── mappings.lua       # Keybindings
    └── options.lua        # Neovim options
```

## 🛠 Installation

```bash
git clone https://github.com/0xrinful/nvim ~/.config/nvim
nvim
```
