--Stolen from https://github.com/ayamir/nvimdots/blob/0e47a512827395781daea8c62efa6297c685b658/lua/core/init.lua
local vim = vim

local disable_distribution_plugins = function()
	-- disable menu loading
	vim.g.did_install_default_menus = 1
	vim.g.did_install_syntax_menu = 1

	-- Do not load native syntax completion
	vim.g.loaded_syntax_completion = 1

	-- Do not load spell files
	vim.g.loaded_spellfile_plugin = 1

	-- Whether to load netrw by default
	 vim.g.loaded_netrw = 1
	 vim.g.loaded_netrwFileHandlers = 1
	 vim.g.loaded_netrwPlugin = 1
	 vim.g.loaded_netrwSettings = 1

	-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
	vim.g.netrw_liststyle = 3

	-- Do not load tohtml.vim
	vim.g.loaded_2html_plugin = 1

	-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
	-- related to checking files inside compressed files)
	vim.g.loaded_gzip = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_vimball = 1
	vim.g.loaded_vimballPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1

	-- Do not use builtin matchit.vim and matchparen.vim since the use of vim-matchup
	vim.g.loaded_matchit = 1
	vim.g.loaded_matchparen = 1

	-- Disable sql omni completion.
	vim.g.loaded_sql_completion = 1
end

local clipboard_config = function()	
	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
		paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
		cache_enabled = 0,
	}
end

local load_core = function()	
	disable_distribution_plugins()
	clipboard_config()

	require("core.options")
	require("keymap.keymaps")
    require("modules.plugins")
    require("autocmds.autocmds")

	vim.cmd [[colorscheme catppuccin]]
end

load_core()
