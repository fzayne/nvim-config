return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        local ft = require('Comment.ft')
        ft.set('blade', '{{--%s')
    end
}
