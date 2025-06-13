return {
  "sainnhe/sonokai",
  priority = 1000,

  config = function()
    -- Set before colorscheme → tells sonokai how to behave
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_transparent_background = 1
    vim.g.sonokai_style = "andromeda" -- (other options: 'default', 'atlantis', 'shusia', 'maia')

    vim.cmd("colorscheme sonokai")

    -- Extra forced transparency (optional but useful)
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "sonokai",
      callback = function()
        vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi FloatBorder guibg=NONE ctermbg=NONE]])
        vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
      end,
    })

    -- Trigger ColorScheme autocmd to enforce transparency now
    vim.cmd("colorscheme sonokai")
  end,
}

