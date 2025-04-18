return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        vim.keymap.del('o', 'gc')
        require('Comment').setup({
            pre_hook = function(ctx)
                local ft = require('Comment.ft')

                -- 1. Using set function

                ft.set('blade', '{{-- %s --}}')
                -- local ft = vim.bo.filetype
                -- if ft == 'blade' then
                --     vim.bo.commentstring = '{{-- %s --}}'
                -- end
            end
        })
        -- local ft = require('Comment.ft')
        -- ft.set('blade', '{{--%s')
    end
}
