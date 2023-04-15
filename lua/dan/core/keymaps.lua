
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Prev and Next buffers
vim.keymap.set('n', '<C-a>', ':bprev<CR>')
vim.keymap.set('n', '<C-f>', ':bnext<CR>')
-- Close current buffer
vim.keymap.set('n', '<C-w>', ':bd!<CR>')
-- Move current buffer to the left
vim.keymap.set('n', '<C-Q>', ':BufferLineMovePrev<CR>')
-- Move current buffer to the right
vim.keymap.set('n', '<C-Q>', ':BufferLineMoveNext<CR>')

-- Toggle nvim-tree explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').live_grep, { desc = '[S]earch [T]text with Grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earth [D]iagnostics' })

vim.keymap.set('n', '<leader>gb', ':G blame<CR>')
vim.keymap.set('n', '<leader>gs', ':G status<CR>')
vim.keymap.set('n', '<leader>gd', ':G diff<CR>')
vim.keymap.set('n', '<leader>gvd', ':Gvdiffsplit<CR>')
