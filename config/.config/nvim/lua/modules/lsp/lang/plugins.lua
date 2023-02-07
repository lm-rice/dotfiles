local lang = {}
local conf = require("modules.lang.config")

lang["simrat39/rust-tools.nvim"] = {
    lazy = true,
    ft = "rust",
    config = config,
    dependencies = "nvim-lua/plenary.nvim",
}

lang["iamcco/markdown-preview.nvim"] = {
    lazy = true,
    ft = "markdown",
    run = "cd app && yarn install",
}
