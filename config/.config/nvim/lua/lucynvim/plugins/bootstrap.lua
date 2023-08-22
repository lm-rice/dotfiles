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
local editor_config = require("lucynvim.plugins.editor.config")
local lsp_config = require("lucynvim.plugins.lsp.config")
local colorscheme_config = require("lucynvim.plugins.colorscheme")
local plugins = {
    -- Editor status bar --
    {
        "nvim-lualine/lualine.nvim",
        config = editor_config.lualine,
    },
    -- Highlighting --
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufReadPost",
        config = editor_config.nvim_treesitter,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "RRethy/nvim-treesitter-textsubjects",
        },
        { "RRethy/nvim-treesitter-endwise" },
    },

    -- LSP Servers --
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        opts = {
            inlay_hints = { enabled = true },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local default_servers = {
                "racket_langserver",
            }

            for _, lsp in pairs(default_servers) do
                lspconfig[lsp].setup({
                    -- TODO look into on_attach https://github.com/edr3x/.dotfiles/blob/master/nvim/.config/nvim/lua/r3x/plugins/lsp.lua
                    capabilities = capabilities
                })
            end

            lspconfig["clangd"].setup({
                capabilities = capabilities,
            })

            lspconfig["bashls"].setup({
                filetypes = { "sh", "zsh" },
            })

            lspconfig["lua_ls"].setup({
                single_file_support = true,
                settings = {
                    Lua = {
                        workspace = {
                            library = { vim.env.VIMRUNTIME },
                            checkThirdParty = false,
                        },
                        completion = { workspaceWord = true, callSnippet = "Both" },
                    },
                    misc = {
                        parameters = {
                            -- "--log-level=trace",
                        },
                    },
                    hint = {
                        enable = true,
                        setType = false,
                        paramType = true,
                        paramName = "Disable",
                        semicolon = "Disable",
                        arrayIndex = "Disable",
                    },
                    doc = { privateName = { "^_" } },
                    type = { castNumberToInteger = true },
                    diagnostics = {
                        disable = { "incomplete-signature-doc", "trailing-space" },
                        -- enable = false,
                        groupSeverity = { strong = "Warning", strict = "Warning" },
                        groupFileStatus = {
                          ["ambiguity"] = "Opened",
                          ["await"] = "Opened",
                          ["codestyle"] = "None",
                          ["duplicate"] = "Opened",
                          ["global"] = "Opened",
                          ["luadoc"] = "Opened",
                          ["redefined"] = "Opened",
                          ["strict"] = "Opened",
                          ["strong"] = "Opened",
                          ["type-check"] = "Opened",
                          ["unbalanced"] = "Opened",
                          ["unused"] = "Opened",
                        },
                        unusedLocalExclude = { "_*" },
                    },
                    format = {
                        enable = false,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                            continuation_indent_size = "2",
                        },
                    },
                },
            })
        end
    },

    -- Completion -- 
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
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
        config = lsp_config.cmp,
    },

    -- Colorscheme --
    {
        "Everblush/nvim",
        name = 'everblush',
        config = colorscheme_config.everblush,
    },
}

-- Start & define local plugin path
require("lazy").setup(plugins, { dev = { path = "~/Projects/neovim-plugins/" } })

