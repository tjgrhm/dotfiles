local m = {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  lazy = true,
  enabled = true,
  build = { ":TSUpdate" },
  event = { "BufNewFile", "BufReadPost" },
}

function m.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "help", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {},
    },
    incremental_selection = {
      enable = false,
      disable = {},
    },
    indent = {
      enable = false,
      disable = {},
    },
  })

  return nil
end

return m
