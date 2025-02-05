local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('xml', {

  -- General purpose definitions

  s(
    '<block',
    fmt(
      [[
      <{}>
        {}
      </{}>
      ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),

  -- TOT snippet definitions

  s(';newline', t '&#xA;'),

  s(
    '<attr',
    fmt(
      [[
      <Attribute {}="{}" {}/>
      ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),

  s(
    '<desc',
    fmt(
      [[
      <Object ID="{}" DisplayName="{}" Type="{}">
        {}
      </Object>
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    )
  ),

  s(
    '<tl-obj',
    fmt(
      [[
    <Object ID="{}" Value1="{}">
      <AddDescriptorObject ID="{}" />
    </Object>
    ]],
      {
        i(1),
        i(2),
        rep(2),
      }
    )
  ),

  s(
    '<tl-obj',
    fmt(
      [[
    <Object ID="{}" Value1="{}">
      <AddDelegate ID="{}" />
    </Object>
    ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),
})
