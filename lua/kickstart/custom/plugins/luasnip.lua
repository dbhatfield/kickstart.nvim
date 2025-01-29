return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    config = function()
      local ls = require 'luasnip'

      require 'luasnip.xml-snippets'

      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if ls.jumpable() then
          ls.jump(-1)
        end
      end, { silent = true })
    end,
  },
}
