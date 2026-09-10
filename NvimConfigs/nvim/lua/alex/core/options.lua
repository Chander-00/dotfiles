vim.cmd("let g:netwr_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- Space for tabs
opt.shiftwidth = 2
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent to new lines from current one

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.clipboard = "unnamed,unnamedplus"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
