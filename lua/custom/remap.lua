vim.g.mapleader = " "
-- nvim tree keymap
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })
vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = "Focus file explorer" })
vim.keymap.set('n', '<leader>E', ':NvimTreeClose<CR>', { desc = "Close file explorer" })

-- inc rename keymap
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- refactoring remap
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")



-- Blade files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'blade',
    callback = function()
        vim.keymap.set('v', '<leader>t', 'c{{ __(\'<C-r>"\') }}<Esc>', {
            buffer = true,
            noremap = true,
            silent = true,
            desc = 'Wrap with Blade translation'
        })
    end
})

-- PHP files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'php',
    callback = function()
        vim.keymap.set('v', '<leader>t', 'ctrans(<C-r>")<Esc>', {
            buffer = true,
            noremap = true,
            silent = true,
            desc = 'Wrap with PHP trans()'
        })
    end
})

vim.keymap.set('n', '<leader>fm', function()
    require('conform').format({ async = true, lsp_fallback = true })
end, { desc = '[F]or[M]at document' })

-- Format visual selection
vim.keymap.set('v', '<leader>fm', function()
    require('conform').format({ async = true, lsp_fallback = true }, vim.fn.line("'<"), vim.fn.line("'>"))
end, { desc = '[F]or[M]at selection' })
