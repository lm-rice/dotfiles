vim.cmd [[
    augroup SetBackgroundTransparent
        autocmd colorscheme * :hi normal guibg = NONE
    augroup END
]]
