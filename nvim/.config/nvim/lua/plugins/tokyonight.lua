local m = {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = true,
  enabled = true,
}

function m.config()
  require("tokyonight").setup({
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  })

  return nil
end

return m
