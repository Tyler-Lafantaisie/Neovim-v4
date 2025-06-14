return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs                   = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },
            signcolumn              = true,
            numhl                   = false,
            linehl                  = false,
            word_diff               = false,
            current_line_blame      = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 300,
                ignore_whitespace = false,
            },
            preview_config          = {
                border = "rounded",
            },
            -- yadm                    = { enable = false },
        })

        -- Optional: Keymaps for common actions
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "]c", gs.next_hunk)
        vim.keymap.set("n", "[c", gs.prev_hunk)
        vim.keymap.set("n", "<leader>gs", gs.stage_hunk)
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk)
        vim.keymap.set("n", "<leader>gS", gs.stage_buffer)
        vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk)
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk)
        vim.keymap.set("n", "<leader>gb", gs.blame_line)
    end,
}
