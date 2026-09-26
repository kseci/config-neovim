-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
local languages = {
  'c',
  'cpp',
  'go',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'rust',
  'typescript',
  'vim',
  'vimdoc',
}

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}
require('nvim-treesitter').install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'go', 'help', 'lua', 'markdown', 'python', 'rust', 'typescript', 'vim' },
  callback = function(args)
    vim.treesitter.start(args.buf)

    local filetype = vim.bo[args.buf].filetype
    if filetype ~= 'python' and filetype ~= 'help' and filetype ~= 'vim' then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

local textobjects = require('nvim-treesitter-textobjects')
textobjects.setup {
  select = { lookahead = true },
  move = { set_jumps = true },
}

local select_textobject = require('nvim-treesitter-textobjects.select').select_textobject
for key, capture in pairs {
  aa = '@parameter.outer',
  ia = '@parameter.inner',
  af = '@function.outer',
  ['if'] = '@function.inner',
  ac = '@class.outer',
  ic = '@class.inner',
} do
  vim.keymap.set({ 'x', 'o' }, key, function()
    select_textobject(capture, 'textobjects')
  end)
end

local move = require('nvim-treesitter-textobjects.move')
local function map_move(key, method, capture)
  vim.keymap.set({ 'n', 'x', 'o' }, key, function()
    move[method](capture, 'textobjects')
  end)
end

map_move(']m', 'goto_next_start', '@function.outer')
map_move(']]', 'goto_next_start', '@class.outer')
map_move(']M', 'goto_next_end', '@function.outer')
map_move('][', 'goto_next_end', '@class.outer')
map_move('[m', 'goto_previous_start', '@function.outer')
map_move('[[', 'goto_previous_start', '@class.outer')
map_move('[M', 'goto_previous_end', '@function.outer')
map_move('[]', 'goto_previous_end', '@class.outer')

local swap = require('nvim-treesitter-textobjects.swap')
vim.keymap.set('n', '<leader>a', function()
  swap.swap_next('@parameter.inner')
end)
vim.keymap.set('n', '<leader>A', function()
  swap.swap_previous('@parameter.inner')
end)
