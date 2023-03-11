local m = {
  "williamboman/mason.nvim",
  name = "mason",
  lazy = true,
  enabled = true,
  cmd = { "Mason" },
}

function m.config()
  require("mason").setup()
  return nil
end

return m
