-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- true if Nerd Font Installed
vim.g.have_nerd_font = true
-- require("vim-options")

-- [[ Install `lazy.nvim` plugin manager ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{ import = "plugins" },
	{ import = "LSP.plugins" })

-- TODO:
-- declare with import all the plugins and comment out 
-- here the ones you dont want to use,
-- instead of doing this in individual plugin files, eg.:
--[[
--return {
	-- disable trouble
	{ "folke/trouble.nvim", enabled = false },
}
]]--
