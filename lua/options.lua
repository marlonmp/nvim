-- global
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.ruler = true
vim.opt.colorcolumn = '80,100'

-- enable whitespace rendering
vim.opt.list = true
vim.opt.listchars = {
  space = '·',
  tab = '→ ',
  trail = '•',
  -- eol = '↲',
  nbsp = '␣',
}

-- undo tree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- language by language config
local indent_group = vim.api.nvim_create_augroup("IndentSettings", { clear = true })

-- golang options
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    group = indent_group,
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})

-- python options
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    group = indent_group,
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})
