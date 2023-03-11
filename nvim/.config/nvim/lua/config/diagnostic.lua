local m = {}

local signs = {
  { name = "DiagnosticSignInfo", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignError", text = "" },
}

function m.setup()
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, linehl = "", numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
  })

  return nil
end

return m
