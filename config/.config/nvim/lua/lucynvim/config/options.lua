-- This file is automatically loaded by lucynvim.config.init --
-- Prefer color scheme for coloring
vim.opt.termguicolors = true

-- Enable line numbering (see :h number_relativenumber)
vim.opt.number = true
vim.opt.relativenumber = true
--vim.opt.numberwidth = 6

-- Allow use of the mouse
vim.opt.mouse = "a"

-- Enable autoformatting options
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.expandtab = true

-- Whitespace widths
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Disable line wrapping
vim.opt.wrap = false

-- Set min lines visible to 5
vim.opt.scrolloff = 5

-- Enable smart case
vim.opt.smartcase = true

-- Enable copy to clipboard.
-- Treats both registers, + and *, as the same.
-- Redundant on MacOS but nice if we don't need both on Linux envs.
vim.opt.clipboard = "unnamedplus"

-- Lists
vim.opt.list = true
vim.opt.listchars = {
    trail = "·",
    extends = ">",
    tab = "  ",
}

-- Store undo buffer in default nvim dir
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

--- Wild Ignore Rules ---
vim.opt.wildignore:append({
    "*/node_modules/*",
})

