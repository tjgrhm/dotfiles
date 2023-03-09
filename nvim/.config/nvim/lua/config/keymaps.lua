local m = {}

local defaults = {
  n = { noremap = true, silent = true }, -- normal mode
  i = { noremap = true, silent = true }, -- insert mode
  v = { noremap = true, silent = true }, -- visual mode
  x = { noremap = true, silent = true }, -- visual block mode
  c = { noremap = true, silent = true }, -- command mode
  o = { noremap = true, silent = true }, -- operator pending mode
  t = { silent = true }, -- terminal mode
}

local keymaps = {}

function m.setup()
  vim.g.mapleader = " "

  for mode, table in pairs(keymaps) do
    local opts = vim.deepcopy(defaults[mode])
    for _, value in ipairs(table) do
      opts.desc = value.desc
      vim.keymap.set(mode, value.lhs, value.rhs, opts)
    end
  end

  return nil
end

return m
