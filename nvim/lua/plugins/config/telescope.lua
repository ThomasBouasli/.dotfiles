
local plugin = {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' }
}

local keymap = {
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Recent files" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help tags" },
    ["<leader>fc"] = { "<cmd> Telescope commands <CR>", "Commands" },
}

return { plugin = plugin , keymap = keymap }