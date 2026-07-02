-- Follow the macOS light/dark setting, matching ghostty and zed:
--   light -> Rosé Pine Dawn   dark -> Tokyo Night
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = { variant = "auto", dark_variant = "main" },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 900,
    opts = {
      update_interval = 3000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("tokyonight-night")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("rose-pine-dawn")
      end,
    },
  },
}
