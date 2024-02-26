require('lsp-inlayhints').setup({
  inlay_hints = {
    parameter_hints = {
      show = false,
    },
    type_hints = {
      show = true,
      prefix = '',
      separator = ', ',
      remove_colon_start = false,
      remove_colon_end = false,
    },
    labels_separator = '  ',
    highlight = 'LspInlayHint',
    priority = 0,
  },
  enabled_at_startup = true,
  debug_mode = false,
})
