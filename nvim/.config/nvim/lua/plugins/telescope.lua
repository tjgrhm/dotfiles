local m = {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  lazy = true,
  enabled = true,
  dependencies = {
    { "nvim-lua/plenary.nvim", name = "plenary" },
  },
  cmd = { "Telescope" },
}

function m.config()
  local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
  table.insert(vimgrep_arguments, "--hidden")
  table.insert(vimgrep_arguments, "--glob")
  table.insert(vimgrep_arguments, "!**/.git/*")

  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
          ["<c-h>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
      vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
      find_files = {
        file_ignore_patterns = { ".git/*" },
        hidden = true,
      },
      git_files = {
        hidden = true,
      },
    },
  })

  return nil
end

return m
