return { -- lazy
    'ccaglak/namespace.nvim',
    -- keys = {
    --     { "<leader>la", "<cmd>Php classes<cr>", },
    --     { "<leader>lc", "<cmd>Php class<cr>" },
    --     { "<leader>ln", "<cmd>Php namespace<cr>" },
    --     { "<leader>ls", "<cmd>Php sort<cr>" },
    -- },
    dependencies = {
        "ccaglak/phptools.nvim", -- optional
        "ccaglak/larago.nvim",   -- optional
    },
    config = function()
        require('namespace').setup({
            ui = true,                     -- default: true -- false only if you want to use your own ui
            cacheOnload = false,           -- default: false -- cache composer.json on load
            dumpOnload = false,            -- default: false -- dump composer.json on load
            sort = {
                on_save = false,           -- default: false -- sorts on every search
                sort_type = 'length_desc', -- default: natural -- seam like what pint is sorting
                --  ascending -- descending -- length_asc
                -- length_desc -- natural -- case_insensitive
            }
        })
    end
}
