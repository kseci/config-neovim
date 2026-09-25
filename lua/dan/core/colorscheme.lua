local ok = pcall(function()
  require("catppuccin").setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    }
  })
  vim.cmd 'colorscheme catppuccin'
end)
if not ok then
  vim.cmd 'colorscheme default'
end
