return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = "hyper", -- or "doom", "hyper", "dashboard"
            config = {
                header = {
                    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                    "               > INITIATE SHELL <                  ",
                },
                center = {
                    { icon = "  ", desc = "New File            ", action = "enew", key = "n" },
                    { icon = "  ", desc = "Find File           ", action = "Telescope find_files", key = "f" },
                    { icon = "  ", desc = "File Explorer       ", action = "NvimTreeToggle", key = "e" },
                    { icon = "󰒲  ", desc = "Update Plugins      ", action = "Lazy sync", key = "u" },
                    { icon = "  ", desc = "Quit                ", action = "qa", key = "q" },
                },
                footer = { "⟟ SYSTEM ONLINE ⟟", "█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█" },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
