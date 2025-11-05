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
			  map('editor.send_line', {'i', 'n'}),
			  map('editor.send_block', {'i', 'n'}),
			  map('editor.send_selection', 'x'),
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
			},
		},
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
-- other keybinds:
  -- local map = scnvim.map
  -- scnvim.setup {
  --   keymaps = {
  --     ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
  --     ['<C-e>'] = {
  --       map('editor.send_block', {'i', 'n'}),
  --       map('editor.send_selection', 'x'),
  --     },
  --     ['<CR>'] = map('postwin.toggle'),
  --     ['<M-CR>'] = map('postwin.toggle', 'i'),
  --     ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
  --     ['<C-k>'] = map('signature.show', {'n', 'i'}),
  --     ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
  --     ['<leader>st'] = map(scnvim.start),
  --     ['<leader>sk'] = map(scnvim.recompile),
  --     ['<F1>'] = map_expr('s.boot'),
  --     ['<F2>'] = map_expr('s.meter'),
  --   },
  -- }
