# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim 0.12+ configuration based on kickstart.nvim. It uses Lua and the `lazy.nvim` plugin manager.

## Architecture

- `init.lua` — Main config file containing core settings, keymaps, autocommands, the lazy.nvim bootstrap, and the `require('lazy').setup { ... }` call that declares and configures most core plugins inline.
- `lua/custom/plugins/*.lua` — User-added plugins. Each file returns a lazy.nvim plugin spec (a table). They are auto-imported by the `{ import = 'custom.plugins' }` entry in the lazy setup. The `init.lua` in that directory just returns `{}`.
- `lua/kickstart/plugins/*.lua` — Optional kickstart example plugins (debug, lint, indent_line, gitsigns, autopairs, neo-tree). These serve as reference configs and are not loaded by default (the `require 'kickstart.plugins.*'` lines in init.lua are commented out).
- `lua/luasnip/xml-snippets.lua` — Custom LuaSnip snippets for XML/TOT workflows, loaded via `require 'luasnip.xml-snippets'` in `lua/custom/plugins/luasnip.lua`.

## Key Conventions

- **Plugin manager**: `lazy.nvim` (bootstrapped automatically in init.lua). Use `:Lazy` to check status, `:Lazy update` to update. Lock file is `lazy-lock.json` in the config directory.
- **Plugin specs**: Use the standard lazy.nvim `'owner/repo'` short form. Configure via `opts = {}` (passed to the plugin's `setup()`) or `config = function() ... end` for full control.
- **Build steps**: Handled via lazy.nvim's `build` key on a plugin spec (e.g. telescope-fzf-native uses `build = 'make'`, LuaSnip `build = 'make install_jsregexp'`, treesitter `build = ':TSUpdate'`).
- **LSP**: Managed via mason.nvim + mason-lspconfig. Rust uses rustaceanvim (mason-lspconfig handler explicitly skips `rust_analyzer` with an empty function). Add new LSP servers to the `servers` table in init.lua.
- **Formatting**: conform.nvim with format-on-save. Stylua for Lua. Disable format-on-save per filetype in the `disable_filetypes` table.
- **Completion**: blink.cmp with LuaSnip snippets.
- **Leader key**: Space. Key group prefixes (from the which-key spec in init.lua): `<leader>c` (Code), `<leader>d` (Document), `<leader>r` (Rename), `<leader>s` (Search), `<leader>w` (Workspace), `<leader>t` (Toggle), `<leader>h` (Git Hunk), `<leader>n` (Harpoon).
- **Colorscheme**: Uses last-color.nvim to persist theme choice. Kanagawa, Catppuccin, and Gruvbox are installed.
- **Shell**: Set to `/bin/fish` on Unix, `pwsh` on Windows.
- **Nerd Font**: Assumed available (`vim.g.have_nerd_font = true`).

## Adding a New Plugin

Create a new file in `lua/custom/plugins/` that returns a lazy.nvim plugin spec:

```lua
return {
  'author/plugin-name',
  opts = {
    -- options passed to require('plugin-name').setup()
  },
  -- or use `config = function() ... end` for full control
}
```

It will be auto-imported via the `{ import = 'custom.plugins' }` entry in the lazy setup in init.lua.

## Health Check

Run `:checkhealth` inside Neovim to diagnose issues with the configuration.
Run `:checkhealth lazy` to check plugin manager status specifically.
