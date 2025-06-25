return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },

    config = function()
        vim.keymap.del('o', 'gc')

        local ft = require('Comment.ft')

        -- 1. Using set function

        ft.set('blade', '{{-- %s --}}')
        require('Comment').setup({
            pre_hook = function(ctx)
                if vim.bo.filetype == 'blade' then
                    vim.bo.commentstring = '{{-- %s --}}'
                end
            end
        })
        -- local ft = require('Comment.ft')
        -- ft.set('blade', '{{--%s')
    end
}
