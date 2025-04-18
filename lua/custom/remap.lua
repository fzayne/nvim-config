vim.g.mapleader = " "
-- nvim tree keymap
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })
vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = "Focus file explorer" })
vim.keymap.set('n', '<leader>E', ':NvimTreeClose<CR>', { desc = "Close file explorer" })

-- inc rename keymap
vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "rename the variable" })

-- refactoring remap
vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "rafactoring extract function" })
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "refactoring extract to file" })
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "refactoring extract variable" })
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "refactoring inline variable" })
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "refactoring inline function" })
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "refactoring extract block" })
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "refactoring extract block to file" })

-- namesapce remaps
vim.keymap.set("n", "<leader>lg", "<cmd>Php classes<cr>", { desc = "GetClasses", silent = true })
vim.keymap.set("n", "<leader>lc", "<cmd>Php class<cr>", { desc = "GetClass", silent = true })
vim.keymap.set("n", "<leader>ln", "<cmd>Php namespace<cr>", { desc = "Namespace", silent = true })
vim.keymap.set("n", "<leader>ls", "<cmd>Php sort<cr>", { desc = "Sort Classes", silent = true })

-- larago remaps
vim.keymap.set("n", "<leader>gg", "<cmd>GoBlade<cr>", { desc = "go to file" })






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
