return {
  -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
      javascript = { { 'prettierd', 'prettier' } },
      ['*'] = { 'codespell' },
      ['_'] = { 'trim_whitespace' },
    },
  },
}
