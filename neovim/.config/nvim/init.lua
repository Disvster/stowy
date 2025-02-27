-- Lazy PKGM
require("config.lazy")
-- colorscheme "catppuccin-macchiato"

-- VIM settings
vim.opt.nu = true
vim.opt.relativenumber = true
--vim.cmd.colorscheme "catppuccin-frappe"
vim.cmd.colorscheme "catppuccin-macchiato"
--vim.cmd.colorscheme "catppuccin-latte"
--vim.cmd.colorscheme "catppuccin-mocha"

-- LineNumberColors
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffe5b4', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray', bold=false })

