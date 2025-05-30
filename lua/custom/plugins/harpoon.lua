return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    -- Telescope setup
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- Keymaps
    vim.keymap.set('n', '<leader>nl', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[L]ist harpoon pins' })
    vim.keymap.set('n', '<leader>na', function()
      harpoon:list():select(1)
    end, { desc = 'Open Pin 1' })
    vim.keymap.set('n', '<leader>ns', function()
      harpoon:list():select(2)
    end, { desc = 'Open Pin 2' })
    vim.keymap.set('n', '<leader>nd', function()
      harpoon:list():select(3)
    end, { desc = 'Open Pin 3' })
    vim.keymap.set('n', '<leader>nf', function()
      harpoon:list():select(4)
    end, { desc = 'Open Pin 4' })

    vim.keymap.set('n', '<leader>nn', function()
      harpoon:list():add()
    end, { desc = 'Pin cursor to harpoon' })
    vim.keymap.set('n', '<leader>nc', function()
      harpoon:list():remove()
    end, { desc = 'Clear harpoon pins' })
  end,
}
