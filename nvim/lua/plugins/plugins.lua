require("plugins.config.lazy")

local plugins = {
    require("plugins.config.mason").plugin,
    require("plugins.config.lspconfig").plugin,
    require("plugins.config.nvimtree").plugin,
    require("plugins.config.telescope").plugin,
    require("plugins.config.treesitter").plugin,
    require("plugins.config.whichkey").plugin,
    require("plugins.config.theme").plugin,
}

require("lazy").setup(plugins)