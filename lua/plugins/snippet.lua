return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.*",
        build = "make install_jsregexp",

        config = function()
            require("luasnip").config.set_config {
                history = true,
                updateevents = "TextChanged, TextChangedI",
            }
            local ls = require("luasnip")
            local snip = ls.snippet
            local tNode = ls.text_node
            local iNode = ls.insert_node
            require("luasnip.loaders.from_vscode").lazy_load()
            -- keymaps
            vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            -- Custom snippets
            ls.add_snippets("lua", {
                snip("nvim", {
                    tNode("config = function"), tNode("()"),
                    tNode({ "", " " }), iNode(1, "--body"),
                    tNode({ "", "end," })
                }),
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",     -- LSP completions
            "hrsh7th/cmp-buffer",       -- Buffer words
            "hrsh7th/cmp-path",         -- File paths
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completions for cmp
        },
        event = "InsertEnter",

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                completion = {
                    completopt = "menu, menuone,oninsert",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP
                    { name = "luasnip" },  -- Snippets
                    { name = "buffer" },   -- Current buffer
                    { name = "path" },     -- Filesystem paths
                }),

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symobol_text",
                        maxwidth = 50,
                        elipsis_char = "...",
                    }),
                },
            })
        end,
    }
}
