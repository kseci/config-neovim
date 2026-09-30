require('CopilotChat').setup({
  model = 'auto',
  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool'
  },
  separator = '────────────────',
  auto_fold = true,
  window = {
    layout = 'vertical',
    width = 0.42,
    border = 'rounded',
    title = ' Copilot ',
  },
  trusted_tools = { 'file', 'glob', 'grep'},
  tools = {'copilot', 'neovim'}
})

vim.api.nvim_set_hl(0, 'CopilotChatAnnotationHeader', { link = 'Title' })
vim.api.nvim_set_hl(0, 'CopilotChatAnnotation', { link = 'Comment' })

