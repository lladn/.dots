vim.cmd.colorscheme("tokyonight")

vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true


vim.opt.shortmess:append("I") -- get rid of the logo
vim.opt.undofile = true       -- presistent undo across session
vim.opt.scrolloff = 16        -- keep cursor away from the edge
