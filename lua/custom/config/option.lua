vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.g.neovide_scale_factor = 1.0
vim.opt.guifont = "FiraCode Nerd Font:h14" -- Set exact font size

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true




vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    },
})

-- Disable automatic comment insertion on new lines
vim.opt.formatoptions = vim.opt.formatoptions - "o" - "r"

-- Clear default 'comments' setting (optional, but helps avoid conflicts)
vim.opt.comments = ""


vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "blade" then
            vim.bo.commentstring = "{{-- %s --}}"
        end
    end,
})
