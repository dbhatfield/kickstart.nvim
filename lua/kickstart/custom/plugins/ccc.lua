return {
  'uga-rosa/ccc.nvim',
  event = 'FileType',
  config = function()
    local ccc = require 'ccc'
    local p = ccc.picker
    ccc.setup {
      pickers = { p.hex_long, p.css_rgb, p.css_hsl, p.css_hwb, p.css_lab, p.css_lch, p.css_oklab, p.css_oklch },
      highlighter = {
        auto_enable = true,
        excludes = { 'dart', 'lazy', 'orgagenda', 'org', 'NeogitStatus', 'toggleterm' },
      },
    }
  end,
}
