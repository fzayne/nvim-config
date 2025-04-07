vim.opt.guicursor=""

vim.opt.nu=true
vim.opt.relativenumber=true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.opt.smartindent=true

vim.opt.wrap=false
vim.g.neovide_scale_factor = 1.0
vim.opt.guifont = "FiraCode Nerd Font:h14"  -- Set exact font size

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true




vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
