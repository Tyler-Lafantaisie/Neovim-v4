return {
    {
        "mason-org/mason.nvim",

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
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "ast_grep", "basedpyright", "harper_ls", "bashls", "cssls", "html", "clangd", "biome", "jdtls", "ts_ls" },
        }
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },

        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end
            -- lsps
            lspconfig.html.setup({ on_attach = on_attach })
            lspconfig.pyright.setup({ on_attach = on_attach })
            lspconfig.lua_ls.setup({ on_attach = on_attach })
            lspconfig.rust_analyzer.setup({
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                }
            })
            lspconfig.ast_grep.setup({ on_attach = on_attach })
            lspconfig.basedpyright.setup({ on_attach = on_attach })
            lspconfig.harper_ls.setup({ on_attach = on_attach })
            lspconfig.bashls.setup({ on_attach = on_attach })
            lspconfig.cssls.setup({ on_attach = on_attach })
            lspconfig.clangd.setup({ on_attach = on_attach })
            lspconfig.biome.setup({ on_attach = on_attach })
            lspconfig.jdtls.setup({ on_attach = on_attach })
            lspconfig.ts_ls.setup({ on_attach = on_attach })
        end,
    },
}
