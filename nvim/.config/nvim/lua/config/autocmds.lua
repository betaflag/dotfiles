local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("cfg_" .. name, { clear = true })
end

-- Reload files changed on disk (Claude Code edits externally)
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("autoread"),
  callback = function()
    if vim.o.buftype ~= "nofile" then vim.cmd("checktime") end
  end,
})

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})

-- Create missing parent directories on save
autocmd("BufWritePre", {
  group = augroup("auto_mkdir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    local file = (vim.uv or vim.loop).fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Per-language indent (base is 2; these mirror the zed config)
autocmd("FileType", {
  group = augroup("indent_four"),
  pattern = { "python", "rust" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
autocmd("FileType", {
  group = augroup("indent_go"),
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
autocmd("FileType", {
  group = augroup("prose"),
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})
