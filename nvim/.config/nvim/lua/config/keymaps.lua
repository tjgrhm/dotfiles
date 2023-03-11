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

local keymaps = {
  n = { -- normal mode
    -- diagnostic
    { lhs = "[d", rhs = vim.diagnostic.goto_prev, desc = "goto previous diagnostic" },
    { lhs = "]d", rhs = vim.diagnostic.goto_next, desc = "goto next diagnostic" },
    { lhs = "<leader>d", rhs = vim.diagnostic.open_float, desc = "show diagnostics" },

    -- search
    { lhs = "<leader>fb", rhs = "<cmd>Telescope buffers<cr>", desc = "find buffers" },
    { lhs = "<leader>ff", rhs = "<cmd>Telescope find_files<cr>", desc = "find files" },
    { lhs = "<leader>fr", rhs = "<cmd>Telescope oldfiles<cr>", desc = "find recent files" },
    { lhs = "<leader>ft", rhs = "<cmd>Telescope live_grep<cr>", desc = "find text" },

    -- git
    { lhs = "<leader>gb", rhs = "<cmd>Telescope git_branches<cr>", desc = "git branches" },
    { lhs = "<leader>gc", rhs = "<cmd>Telescope git_commits<cr>", desc = "git commits" },
    { lhs = "<leader>gC", rhs = "<cmd>Telescope git_bcommits<cr>", desc = "git buffer commits" },
    { lhs = "<leader>gf", rhs = "<cmd>Telescope git_files<cr>", desc = "git files" },
    { lhs = "<leader>gt", rhs = "<cmd>Telescope git_status<cr>", desc = "git status" },
  },
}

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
