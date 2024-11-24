
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Prev and Next buffers
vim.keymap.set('n', '<C-a>', ':bprev<CR>')
vim.keymap.set('n', '<C-f>', ':bnext<CR>')
-- Remap Ctrl-W to Ctrl-N
vim.keymap.set('', '<C-n>', '<C-w>')
-- Close current buffer
vim.keymap.set('n', '<C-w>', ':bd!<CR>')
-- Move current buffer to the left
--vim.keymap.set('n', '<C-Q>', ':BufferLineMovePrev<CR>')
-- Move current buffer to the right
--vim.keymap.set('n', '<C-E>', ':BufferLineMoveNext<CR>')

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
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
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[R]e[n]ame LSP' })

-- Git
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')
vim.keymap.set('n', '<leader>gs', ':G status<CR>')
vim.keymap.set('n', '<leader>gd', ':G diff<CR>')
vim.keymap.set('n', '<leader>gv', ':Gvdiffsplit!<CR>')
vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<CR>')
vim.keymap.set('n', '<leader>gn', '<cmd>diffget //3<CR>')
vim.keymap.set('n', '<leader>gg', ':Git<CR>')
vim.keymap.set('n', '<leader>gt', ':G difftool<CR>')
vim.keymap.set('n', '<leader>gm', ':G mergetool<CR>')

-- Eslint
vim.keymap.set('n', '<leader>fd', ':lua vim.lsp.buf.format()<CR>', { desc = '[F]ormat [D]ocument LSP' })

-- Center vertically
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen after half screen up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen after half screen down' })
