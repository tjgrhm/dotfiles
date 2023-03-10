local m = {}

local options = {
  -- user interface
  colorcolumn = { 81 },
  cursorline = true,
  laststatus = 3,
  number = true,
  ruler = false,
  scrolloff = 8,
  sidescrolloff = 8,
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  wrap = false,

  -- indentation
  autoindent = true,
  expandtab = true,
  shiftwidth = 4,
  softtabstop = 4,
  tabstop = 4,

  -- search
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  smartcase = true,

  -- completion
  completeopt = { "menu", "menuone", "noselect" },
  pumblend = 10,
  pumheight = 10,

  -- folds
  foldenable = false,
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevelstart = 99,
  foldmethod = "expr",

  -- backups
  backup = false,
  swapfile = false,
  undofile = true,

  -- miscellaneous
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  termguicolors = true,
}

function m.setup()
  for key, value in pairs(options) do
    vim.opt[key] = value
  end

  return nil
end

return m
