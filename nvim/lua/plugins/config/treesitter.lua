local plugin = {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            context_commentstring = {
                enable = true,
            },
        })
    end
}

local keymap = {
    ["<leader>tt"] = { "<cmd> TSBufToggle <CR>", "Toggle treesitter" },
}

return { plugin = plugin , keymap = keymap }