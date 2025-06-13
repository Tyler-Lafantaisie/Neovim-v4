return {
  "EdenEast/nightfox.nvim",
  priority = 1000,

  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
      },
    })

    vim.cmd("colorscheme duskfox")

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi FloatBorder guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
      end,
    })

    -- Re-run colorscheme to trigger autocmd
    vim.cmd("colorscheme duskfox")
  end,
}

