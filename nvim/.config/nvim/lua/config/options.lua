local opt = vim.opt

opt.termguicolors = true          -- 24-bit color (required by themes)
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"     -- share the macOS clipboard
opt.undofile = true               -- persistent undo across sessions
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.cursorline = true
opt.wrap = false
opt.confirm = true                -- prompt on unsaved changes instead of failing

-- Indentation: 2 spaces by default; per-language overrides live in autocmds.lua
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- External-edit sync (Claude Code edits files under you)
opt.autoread = true
opt.updatetime = 200

-- Treesitter folding, expanded by default
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

opt.diffopt:append("linematch:60")
