return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    -- Folding settings
    vim.o.foldcolumn = '1' -- '0' is also a good option
    vim.o.foldlevel = 99 -- A high foldlevel to ensure all folds are open by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true -- Enable folding

    -- Key mappings for opening and closing all folds using ufo
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    -- Setup ufo with a provider selector to use treesitter and indent based folding
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
