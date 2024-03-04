local plugin = {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.tsserver.setup{}
        lspconfig.eslint.setup{}
        lspconfig.rust_analyzer.setup{}
        lspconfig.pyright.setup{}
        lspconfig.dockerls.setup{}
        lspconfig.docker_compose_language_service.setup{}
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = {
                      [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                      [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                      [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                      [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                  },
                },
              },
        })
    end
}

local keymap = {
    ["<leader>gd"] = { "<cmd> lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    ["<leader>gr"] = { "<cmd> lua vim.lsp.buf.references()<CR>", "Go to references" },
    ["<leader>gi"] = { "<cmd> lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
    ["<leader>gh"] = { "<cmd> lua vim.lsp.buf.hover()<CR>", "Show hover" },
    ["<leader>ca"] = { "<cmd> lua vim.lsp.buf.code_action()<CR>", "Code action" },
    ["<leader>rn"] = { "<cmd> lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<leader>fs"] = { "<cmd> lua vim.lsp.buf.formatting()<CR>", "Format" },
}

return { plugin = plugin , keymap = keymap }