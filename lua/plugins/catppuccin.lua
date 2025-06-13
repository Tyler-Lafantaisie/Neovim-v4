return{ 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts ={},

    config = function()
        require("catppuccin").setup({
    flavour = "mocha", 
    transparent_background = true, 
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
    },
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
    },
})

vim.cmd.colorscheme "catppuccin"
    end,
}

