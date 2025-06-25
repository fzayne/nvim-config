return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({

            defaults = {
                file_ignore_patterns = {
                    "node_modules/",
                    "public/",
                    "vendor/",
                }
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "telescope find files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope find references' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope Show Diagnostic (Error)' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, {}, { desc = "telescope git files" })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "telescope help tags" })
        vim.keymap.set('n', '<leader>fo', function()
                local opts = {
                    cwd_only = true,
                    only_cwd = true
                }
                builtin.oldfiles(opts)
            end,
            { desc = "telescope find old files" }
        )
    end
}
