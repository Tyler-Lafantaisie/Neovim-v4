return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"catppuccin", "nightfly","tokyonight-moon","tokyonight-night","tokyonight-storm"}  
    })
    end
  }
