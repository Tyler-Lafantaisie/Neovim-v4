return{
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },

    config = function()
        require("hop").setup()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        
        -- Map 'h' to hop to the next occurrence of a character (like Vim's 'f')
        vim.keymap.set("n", "h", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap=true })

        -- Map 'H' to hop to the previous occurrence (like Vim's 'F')
        vim.keymap.set("n", "H", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap=true })

        -- Map '/' to hop to any word in the buffer (instead of normal search)
        vim.keymap.set("n", "/", function()
            hop.hint_words()
        end, { remap=true })

    end,
}
