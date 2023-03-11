local m = {
  "L3MON4D3/LuaSnip",
  name = "luasnip",
  lazy = true,
  enabled = true,
  dependencies = {
    { "rafamadriz/friendly-snippets", name = "friendly-snippets" },
  },
}

function m.config()
  require("luasnip.loaders.from_vscode").lazy_load()
  return nil
end

return m
