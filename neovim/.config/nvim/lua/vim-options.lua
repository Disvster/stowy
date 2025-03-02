vim.cmd.colorscheme("tokyonight-moon")

-- numbers color set to gray
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "orange", bold = false })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "yellow", bold = false })
-- comment colors
vim.api.nvim_set_hl(0, "Comment", { fg = "gray" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
