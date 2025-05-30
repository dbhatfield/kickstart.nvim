return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'

    oil.setup {
      default_file_explorer = true,
    }

    vim.keymap.set('n', '<leader>o', function()
      oil.open_float()
    end, { desc = '[O]pen [O]il Browser' })
  end,
}
