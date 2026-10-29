# nvim-config

My personal Neovim configuration, built on top of [NvChad](https://github.com/NvChad/NvChad) (v2.5).

## Requirements

- Neovim 0.9 or newer
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Plugins added on top of NvChad

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) for debugging (C/C++, C#, JS/TS)
- [symbol-usage.nvim](https://github.com/Wansmer/symbol-usage.nvim) for inline LSP reference counts
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) for highlighting TODO and FIXME comments
- [solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim) colorscheme

## Installation

Back up any existing config first, then clone this repo into the Neovim config directory:

```bash
mv ~/.config/nvim ~/.config/nvim.bak   # skip if you have no existing config
git clone https://github.com/OliverEros/nvim-config.git ~/.config/nvim
nvim
```

Plugins install automatically on first launch.

## Formatting

Lua code is formatted with [StyLua](https://github.com/JohnnyMorant/StyLua) using the settings in `.stylua.toml`:

```bash
stylua .
```
