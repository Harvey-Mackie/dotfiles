-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.ignorecase = true

-- scrolling
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.g.lazygit_config = false
vim.opt.termguicolors = true

vim.g.gruvbox_material_background = 'medium'  -- Options: 'soft', 'medium', 'hard'
vim.g.gruvbox_material_palette = 'material'   -- Options: 'material', 'mix', 'original'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_visual = 'reverse'     -- Options: 'reverse', 'grey background'
vim.g.gruvbox_material_sign_column_background = 'none'
