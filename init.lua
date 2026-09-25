require("dan.core.options")
if require("dan.plugins-setup") then
  return
end

require("dan.core.colorscheme")
require("dan.core.autocmds")

require("dan.plugins.nvim-treesitter")
require("dan.plugins.nvim-tree")
require("dan.plugins.lualine")
require("dan.plugins.gitsigns")
require("dan.plugins.telescope")
require("dan.plugins.bufferline")
require("dan.plugins.nvim-cmp")
require("dan.plugins.mason")
require("dan.plugins.indent-blankline")
require("dan.plugins.neoformat")
require("dan.plugins.copilot")
require("dan.plugins.copilot-chat")

require("dan.core.lsp")
require("dan.core.keymaps")