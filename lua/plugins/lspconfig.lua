return {
    "neovim/nvim-lspconfig",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},
    -- event = {"BuffReadPre", "BuffNewFile"}, -- loads lspconfig in each file

    config = function()
                

        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        

        local capabilities = cmp_nvim_lsp.default_capabilities()



        -- web lsp's 
        require("lspconfig").html.setup{
            capabilities = capabilties,
        }

        require("lspconfig").vuels.setup{
            capabilities = capabilities,
        }
        
        require("lspconfig").tailwindcss.setup{
            capabilities = capabilities,
        }

        require("lspconfig").graphql.setup{
            capabilities = capabilities,
        }

        require("lspconfig").ts_ls.setup{
            capabilities = capabilities,
        }

        require("lspconfig").biome.setup{
            capabilities = capabilities,
        }

        require("lspconfig").eslint.setup{
            capabilities = capabilities,

            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre",{
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        }

        require("lspconfig").jsonls.setup{
            capabilities = capabilities,
        }

        require("lspconfig").cssls.setup{
            capabilities = capabilities,
        }

         


        -- other lsp's
        require("lspconfig").ast_grep.setup{
            capabilities = capabilities,
        }

        require("lspconfig").dockerls.setup{
            capabilities = capabilities,
            settings = {
                docker = {
                    languageserver = {
                        formater = {
                            ingnoreMultilineInstructions = true,

                        }
                    }
                }
            } 
        }
        
        require("lspconfig").pyright.setup{
            capabilities = capabilities,
        }

        require("lspconfig").clangd.setup{
            capabilities = capabilities,
        }
        
        require("lspconfig").bashls.setup{
            capabilities = capabilities,
        }

    end
}
