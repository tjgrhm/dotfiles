local m = {
  "hrsh7th/nvim-cmp",
  name = "cmp",
  lazy = true,
  enabled = true,
  dependencies = {
    { "hrsh7th/cmp-buffer", name = "cmp-buffer" },
    { "hrsh7th/cmp-path", name = "cmp-path" },
    { "saadparwaiz1/cmp_luasnip", name = "cmp-luasnip" },
  },
  event = { "InsertEnter" },
}

local sources = {
  buffer = "[Buffer]",
  path = "[Path]",
  luasnip = "[Snippet]",
}

local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local space = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")

  return col ~= 0 and space == nil
end

function m.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<c-d>"] = cmp.mapping.scroll_docs(4),
      ["<c-u>"] = cmp.mapping.scroll_docs(-4),
      ["<c-c>"] = cmp.mapping.abort(),
      ["<c-y>"] = cmp.mapping.confirm({ select = true }),
      ["<cr>"] = cmp.mapping.confirm({ select = false }),
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      format = function(entry, item)
        item.kind = string.format("%s %s", icons[item.kind], item.kind)
        item.menu = sources[entry.source.name]
        return item
      end,
    },
    sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
  })

  return nil
end

return m
