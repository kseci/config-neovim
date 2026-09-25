---
name: nvim-config
description: "Use when editing, debugging, or extending this Neovim Lua configuration, including startup errors, Packer plugins, Treesitter, Mason, LSP, keymaps, and options."
---

# Neovim Config

Use this skill for changes to this repository's Neovim configuration. Keep edits consistent with its Lua module layout and installed plugin APIs.

## Configuration Map

- `init.lua` controls startup order, configures indent-blankline and diagnostics, and contains the LSP server definitions and setup.
- `lua/dan/core/options.lua` contains editor options and leader keys.
- `lua/dan/core/colorscheme.lua` configures Catppuccin and falls back to Neovim's default colorscheme if it is unavailable.
- `lua/dan/core/keymaps.lua` contains general mappings.
- `lua/dan/plugins-setup.lua` declares Packer plugins, bootstraps Packer, and starts plugin sync when the required Treesitter API is missing.
- `lua/dan/plugins/` contains per-plugin setup for Treesitter, NvimTree, Lualine, Gitsigns, Telescope, Bufferline, nvim-cmp, Mason, Mason-LSPConfig, and Copilot.

## Startup And Bootstrap

1. Reproduce startup failures with `nvim --headless -u "$PWD/init.lua" -c 'qa!'`. Use the first reported Lua error and its stack trace to find the failing module.
2. Preserve the startup order in `init.lua`: options load first, then `dan.plugins-setup`, then plugin-dependent modules.
3. `dan.plugins-setup` returns `true` only while bootstrapping or syncing plugins; `init.lua` then skips plugin-dependent setup for that run. It returns `false` during normal startup. Keep this return explicit: Lua `require()` returns `true` for modules without an explicit return, which can accidentally make an `if require(...) then return end` guard run every time.
4. The early return exits the `init.lua` chunk, not Neovim itself. During a real Packer sync, leave Neovim open until Packer completes, then restart so plugin modules load. For direct installs or updates, use `:PackerSync` and wait for completion.
5. Packer installs under `stdpath('data') .. '/site/pack/packer/start'`. If startup says a plugin is present but its module is missing, inspect that plugin directory and its checked-out branch; directory existence alone does not prove API compatibility.

## Compatibility Constraints

- `lua/dan/plugins/nvim-treesitter.lua` uses the legacy `nvim-treesitter.configs` API. Its Packer spec must stay on `branch = 'master'` unless the Treesitter configuration is migrated to the new API.
- Mason-LSPConfig v2 removed `setup_handlers`. The LSP setup in `init.lua` uses Neovim 0.11+'s `vim.lsp.config()` and then `mason_lspconfig.setup()`. Keep server settings and capabilities in that configuration path.
- The colorscheme is set after plugin setup. Do not add an unconditional `colorscheme onedark` to `core/options.lua`; a missing colorscheme there aborts startup before plugin loading.

## Change And Validation Workflow

1. Put editor-wide options in `lua/dan/core/options.lua`, mappings in `lua/dan/core/keymaps.lua`, plugin configuration in its matching `lua/dan/plugins/*.lua` module, and plugin declarations in `lua/dan/plugins-setup.lua`.
2. Keep LSP server setup in `init.lua` unless the config is deliberately refactored as a separate change. Check Neovim and plugin requirements before adopting a plugin API from current online examples.
3. After edits, run `nvim --headless -u "$PWD/init.lua" -c 'qa!'` to catch startup errors and `git diff --check` to check patch formatting.
4. For LSP or Treesitter changes, additionally verify the expected APIs load, for example:

   ```sh
   nvim --headless -u "$PWD/init.lua" \
     -c 'lua assert(require("nvim-treesitter.configs")); assert(vim.lsp.config.lua_ls)' \
     -c 'qa!'
   ```

A headless `qa!` can terminate pending asynchronous work. Do not use it as proof that Packer sync or parser downloads completed; wait for those tasks to finish in a normal Neovim session or use an explicit completion event.
