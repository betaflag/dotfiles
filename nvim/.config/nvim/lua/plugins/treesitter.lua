return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash", "c", "css", "diff", "dockerfile", "go", "gomod", "gowork",
        "html", "javascript", "json", "jsonc", "lua", "luadoc", "markdown",
        "markdown_inline", "python", "rust", "toml", "tsx", "typescript",
        "vim", "vimdoc", "yaml", "gitcommit", "gitignore",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
