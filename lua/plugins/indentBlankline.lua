return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},

    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FB4934" })    -- red
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FABD2F" }) -- yellow
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83A598" })   -- blue
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FE8019" }) -- orange
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#B8BB26" })  -- green
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D3869B" }) -- purple/violet
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#8EC07C" })   -- aqua/cyan
        end)

        require("ibl").setup { indent = { highlight = highlight } }
    end
}
