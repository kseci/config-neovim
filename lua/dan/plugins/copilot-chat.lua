require('CopilotChat').setup({
  model = 'auto',
  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool'
  },
  trusted_tools = { 'file', 'glob', 'grep'},
  tools = {'copilot', 'neovim'}
})

