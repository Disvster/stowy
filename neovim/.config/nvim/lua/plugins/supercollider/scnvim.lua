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
        ['<localleader>scb'] = map('sclang.boot', 'sc'),
        ['<localleader>scr'] = map('sclang.recompile', 'sc'),
        ['<localleader>sck'] = map('sclang.start', 'sc'),
        ['<localleader>sct'] = map('sclang.stop', 'sc'),
        ['<localleader>scq'] = map('postwin.toggle', 'sc'),
        ['<localleader>scp'] = map('postwin.clear', 'sc'),
        ['<localleader>sc.'] = map('sclang.hard_stop', 'sc'),
      }
    }
    require('scnvim.extensions.piano').setup()
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
