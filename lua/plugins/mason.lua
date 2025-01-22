return{
     "williamboman/mason.nvim",
    dependencies = {"williamboman/mason-lspconfig.nvim"},

    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup {
            ensure_installed = { 
                -- web 
                "tailwindcss",
                "graphql",
                "html",
                "ts_ls",
                "biome",
                "eslint",
                "jsonls",
                "vuels",
                "cssls",
                -- other
                "lua_ls",
                "bashls",
                "clangd",
                "dockerls",
                "pyright",
                "ast_grep"
            },
        }
    end
}
