local function tab_keys()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    return {
        keymap("n", "<Leader>tn", ":tabnew<CR>", opts),
        keymap("n", "<Leader>tc", ":tabclose<CR>", opts),
        keymap("n", "<Leader>tl", ":tabnext<CR>", opts),
        keymap("n", "<Leader>th", ":tabprevious<CR>", opts),
        keymap("n", "<Leader>t>", ":tabmove +1<CR>", opts),
        keymap("n", "<Leader>t<", ":tabmove -1<CR>", opts),
    }
end
return tab_keys()
