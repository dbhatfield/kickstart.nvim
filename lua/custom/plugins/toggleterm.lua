return {
  'akinsho/toggleterm.nvim',
  config = function()
    local toggleterm = require 'toggleterm'

    toggleterm.setup {
      autochdir = true,
    }

    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm dir=%:h:p direction=float<CR>', { desc = 'Toggle terminal open' })
  end,
}
