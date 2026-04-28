return{ -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			local battery = ""
			local battery_file = "/sys/class/power_supply/BAT0/capacity"
			local file = io.open(battery_file, "r")
			if file then
				battery = file:read("*a"):gsub("\n", "")
				io.close(file)
				battery = battery .. "%%"
			end
			return "%2l:%-2v|" .. os.date(" ⏱ %H:%M |🔋") .. battery
		end

		-- Add time and date to the statusline
		-- statusline.section_time = function()
		-- 	return os.date("%Y-%m-%d %H:%M")
		-- end
		--
		-- statusline.content = function(config)
		--   return table.concat({
		-- 	statusline.section_time(),
		-- 	statusline.section_mode(config),
		-- 	statusline.section_git(config),
		-- 	statusline.section_diagnostics(config),
		-- 	statusline.section_filename(config),
		-- 	statusline.section_fileinfo(config),
		-- 	statusline.section_location(config),
		--   }, " ")
		-- end

		require('mini.comment').setup()

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
