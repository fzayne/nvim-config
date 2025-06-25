vim.g.mapleader = " "
-- nvim tree keymap
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })
vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = "Focus file explorer" })
vim.keymap.set('n', '<leader>E', ':NvimTreeClose<CR>', { desc = "Close file explorer" })
vim.keymap.set("n", "<leader>w", "<C-w>p", { desc = "Go to previous window" })

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

--- namespace lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "go to declaration" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "go to implementation" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "hover Documentation" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "Show Diagnostic (Error)" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic", buffer = bufnr })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic", buffer = bufnr })

-- larago remaps
vim.keymap.set("n", "<leader>gg", "<cmd>GoBlade<cr>", { desc = "go to file" })

-- codeium remaps
vim.keymap.set('n', '<leader><CR>', ':Codeium Toggle', { desc = "toggle codeium suggestions" })


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
