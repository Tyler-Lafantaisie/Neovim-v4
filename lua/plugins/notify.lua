return {
    'rcarriga/nvim-notify',

    config = function()
        local notify = require("notify")

        notify.setup({
            stages = "fade",
            background_colour = "#000000",
            timeout = 2000,
            render = "default",
            fps = 60,
        })
        vim.notify = notify

        -- keybinds 
    end,
}
