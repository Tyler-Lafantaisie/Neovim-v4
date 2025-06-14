return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
                relativenumber = true,
            },
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "▶", -- change if you want
                            arrow_open = "▼",
                        },
                    },
                },
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            git = {
                enable = true,
            },
        })

        -- keybinds
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
        -- o or CR to open file or folder
        -- a to create file or folder
        -- d to delete file or folder
        -- r to rename file or folder
        -- x to cut file or folder
        -- c to copy file or folder
        -- p to paste file or folder
        -- s to open horizontal split
        -- v to open vertical split
        -- q to close NvimTree
        -- - to go up a parent directory
        -- I to toggle hidden files
        -- R to refresh
    end,
}
