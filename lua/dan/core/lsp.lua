local function on_attach(_, bufnr)
  local function map(keys, func, desc)
    vim.keymap.set('n', keys, func, {
      buffer = bufnr,
      desc = desc and 'LSP: ' .. desc or nil,
    })
  end

  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  map('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

vim.diagnostic.config({
  underline = true, -- Enforce error highlighting under the text
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●", -- Custom prefix symbol for errors
  },
  severity_sort = true,
  signs = true,
})

local servers = {
  ts_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for server_name, settings in pairs(servers) do
  vim.lsp.config(server_name, {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
  })
end

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
}

require('fidget').setup()
