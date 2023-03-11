local m = {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  lazy = true,
  enabled = true,
  dependencies = {
    { "williamboman/mason.nvim", name = "mason" },
    { "williamboman/mason-lspconfig.nvim", name = "mason-lspconfig" },
    { "folke/neoconf.nvim", name = "neoconf", config = true },
    { "folke/neodev.nvim", name = "neodev", config = true },
  },
  event = { "BufNewFile", "BufReadPre" },
}

local keymaps = {
  { mode = "n", lhs = "K", rhs = vim.lsp.buf.hover, desc = "show hover" },
  { mode = "n", lhs = "gd", rhs = vim.lsp.buf.definition, desc = "goto definition" },
  { mode = "n", lhs = "gD", rhs = vim.lsp.buf.declaration, desc = "goto declaration" },
  { mode = "n", lhs = "gi", rhs = vim.lsp.buf.implementation, desc = "goto implementation" },
  { mode = "n", lhs = "gt", rhs = vim.lsp.buf.type_definition, desc = "goto type definition" },
  { mode = "n", lhs = "gr", rhs = vim.lsp.buf.references, desc = "goto references" },
  { mode = "n", lhs = "<leader>ca", rhs = vim.lsp.buf.code_action, desc = "code action" },
  { mode = "n", lhs = "<leader>cr", rhs = vim.lsp.buf.rename, desc = "rename" },
}

local function on_attach(client, buffer)
  for _, value in ipairs(keymaps) do
    local opts = { noremap = true, silent = true, buffer = buffer, desc = value.desc }
    vim.keymap.set(value.mode, value.lhs, value.rhs, opts)
  end

  return nil
end

function m.config()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
    },
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  require("mason-lspconfig").setup_handlers({
    function(server)
      require("lspconfig")[server].setup({ capabilities = capabilities, on_attach = on_attach })
    end,
  })

  return nil
end

return m
