return {
  'davidgranstrom/scnvim',
  ft = 'supercollider',
  config = function()
    local scnvim = require 'scnvim'
    local map = scnvim.map
    local map_expr = scnvim.map_expr
    scnvim.setup {
      keymaps = {
        ['<localleader>sc'] = {
          map('editor.send_line', '<CR>'),
          map('editor.send_block', '<M-CR>'),
          map('editor.send_selection', '<CR>'),
        },
		['<localleader>scb'] = map('sclang.boot'),
		['<localleader>scr'] = map('sclang.recompile'),
		['<localleader>sck'] = map('sclang.start'),
		['<localleader>sct'] = map('sclang.stop'),
		['<localleader>scq'] = map('postwin.toggle'),
		['<localleader>scp'] = map('postwin.clear'),
		['<localleader>sc.'] = map('sclang.hard_stop'),
      },
	  extensions = {
		piano = {
		default_synth = 'default',  -- or your custom synth name
		note_dur = 0.5              -- default note duration in seconds
		}
	  }
	}
    scnvim.load_extension('piano')
  end
}
-- The keybindings now are:
--
--     <space>sc + Enter - Send line/block/selection
--     <space>scb - Boot SuperCollider server
--     <space>scr - Recompile class library
--     <space>sck - Start sclang (think "k" for "kick start")
--     <space>sct - Stop sclang
--     <space>scq - Toggle post window (think "q" for query)
--     <space>scp - Clear post window
--     <space>sc. - Hard stop (emergency stop all sound)
