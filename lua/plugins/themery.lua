return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
            themes = {"gruvbox","catppuccin", "tokyonight-storm","nightfox","sonokai"},
            livePreview = true,
      })
    end
  }
