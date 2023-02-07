-----------------------------------
-- Bootstrap Lazy plugin manager --
-----------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release. careful of breaking changes
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-------------
-- Plugins --
-------------
local plugins = {
    -- Editor status bar --
    {
        "nvim-lualine/lualine.nvim",
        config = require("modules.editor.config").lualine,
    },
    -- Highlighting --
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufReadPost",
        config = require("modules.editor.config").nvim_treesitter,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "RRethy/nvim-treesitter-textsubjects",
        },
        { "RRethy/nvim-treesitter-endwise" },
    },

    -- Completion -- 
    {
        "hrsh7th/nvim-cmp",
        config = require("modules.lsp.config").cmp,
        dependencies = {
            'L3MON4D3/LuaSnip',
            {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
            'hrsh7th/cmp-nvim-lsp',
            {'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp'},
            {'hrsh7th/cmp-path', after = 'nvim-cmp'},
            {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
            {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
            'lukas-reineke/cmp-under-comparator',
            {'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp'},
        },
    },

    -- LSP -- ; requires is probably breaking me
    {
        "neovim/nvim-lspconfig",
        "folke/trouble.nvim",
        "ray-x/lsp_signature.nvim",
        "kosayoda/nvim-lightbulb", 
    },

    -- Colorscheme --
    {
	    "catppuccin/nvim",
	    as = "catppuccin", 
        config = require("modules.colorscheme.config").catppuccin,
    },

    -- File Browser --
    --[[
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }, 
    },
    ]]
}

-- Start & define local plugin path
require("lazy").setup(plugins, { dev = { path = "~/Projects/neovim-plugins/" } })
