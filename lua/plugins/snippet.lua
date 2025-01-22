return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        version = 'v2.*',
        build = 'make install_jsregexp'
    },

    config = function()
        local cmp = require'cmp'
        cmp.setup({

            snippet = {
                expand = function(args) 
                     require'luansnip'.lsp_expand(args.body)
                end
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({select = true }),
                
            }),
            sources = cmp.config.sources({
                {name = 'cmp'},
                {name = 'cmp-path'},
                {name = 'cmp-cmdline'},
                {name = 'cmp-buffer'},
                {name = 'cmp-nvim-lsp'},
                {name = 'luasnip'},
                {name = 'cmp_luasnip'}
            }),



        })

        local ls = require("luasnip")

        vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent=true})
        vim.keymap.set({"i", "s"}, "<C-e>", function()
            if ls.choice_avtive() then 
                ls.change_choice(1)
            end

        end, {silent = true})

        require("luasnip.loaders.from_vscode").load{}


    end

}
