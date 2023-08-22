local config = {}

function config.everblush()
    require('everblush').setup({
        transparent_background = true,
        override = {
            Comment = { fg = '#ffffff', italic = true }
        },
    })
end

return config
