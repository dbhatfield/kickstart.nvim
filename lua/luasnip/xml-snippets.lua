local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local c = ls.choice_node

ls.add_snippets('xml', {

  -- General purpose definitions

  s(
    'block',
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

  s('newline', t '&#xD;&#xA;'),

  s(
    'attr',
    fmt(
      [[
      <Attribute ID="{}" Value1="{}" />
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s(
    'desc',
    fmt(
      [[
      <Object ID="{}" DefaultValue="" DisplayValue="{}" Type="{}" Value="">
        <Attribute ID="Required" Value1="{}" />
        <Attribute ID="Visible" Value1="{}" />
        <Attribute ID="GUIForceUppercaseTranslation" Value1="True" />
        <Attribute ID="GroupString" Value1="{}" />
        <Attribute ID="ObjectOrder" Value1="{}" />
      </Object>
      ]],
      {
        i(1),
        i(2),
        c(3, {
          t '1',
          t '2',
        }),
        c(4, {
          t 'False',
          t 'True',
        }),
        c(5, {
          t 'False',
          t 'True',
        }),
        i(6),
        i(7),
      }
    )
  ),

  s(
    'desc-date',
    fmt(
      [[
      <Object ID="{}" DefaultValue="" DisplayValue="{}" Type="{}" Value="">
        <Attribute ID="DateFormat" Value1="{}" />
        <Attribute ID="Required" Value1="{}" />
        <Attribute ID="Visible" Value1="{}" />
        <Attribute ID="GUIForceUppercaseTranslation" Value1="True" />
        <Attribute ID="GroupString" Value1="{}" />
        <Attribute ID="ObjectOrder" Value1="{}" />
        <Attribute ID="RegularExpressionConstraint" Value1="[0-9]*" />
        <RuleSet ID="12" Type="0" />
        <RuleSet ID="14" Type="0" />
      </Object>
      ]],
      {
        i(1),
        i(2),
        c(3, {
          t '1',
          t '2',
        }),
        c(4, {
          t 'DDMMCCYY',
          t 'MMYYMMDD',
        }),
        c(5, {
          t 'False',
          t 'True',
        }),
        c(6, {
          t 'False',
          t 'True',
        }),
        i(7),
        i(8),
      }
    )
  ),

  s(
    'workflow-obj',
    fmt(
      [[
    <Object ID="{}" Type="{}" />
      ]],
      {
        i(1),
        c(2, {
          t '1',
          t '2048',
        }),
      }
    )
  ),

  s(
    'nist',
    fmt(
      [[
    <Object ID="{}" BoundIDArray0="{}">
      <AddDescriptorObjectValue Value="{}" ForceUppercase="True" />
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
    'nist-delegate',
    fmt(
      [[
    <Object ID="{}">
      <AddDelegate Value="{}" ForceUppercase="True" />
    </Object>
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),
})
