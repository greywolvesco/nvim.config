local map = vim.keymap.set
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', ';', ':')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move left!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move right!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move up!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move down!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Comment or uncomment line
map('n', '<leader>/', function()
  vim.cmd 'normal gcc'
end, { desc = 'Comment or uncomment in normal mode' })

map('i', '<C-\\>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  vim.cmd 'normal gcc'
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('i', true, false, true), 'n', false)
end, { desc = 'Comment or uncomment in insert mode' })

-- Move line up and down
map('n', '<A-j>', ':m .+1<CR>==')
map('v', '<A-j>', ':m >+1<CR>gv=gv')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-k>', ':m <-2<CR>gv=gv')

-- new file
map('n', '<leader>fn', '<cmd>new<cr>', { desc = 'New file' })
-- save file
map('n', '<leader>fs', '<cmd>w<cr>', { desc = 'Save file' })

-- search and replace
map({ 'v', 'n' }, '<leader>sr', ':%s/', { desc = 'Buffer search and replace' })

-- paste over currently selected text without yanking it
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

map('i', '<C-f>', function()
  vim.cmd.stopinsert()
  vim.lsp.buf.signature_help()
  vim.defer_fn(function()
    vim.cmd.wincmd 'w'
  end, 100)
  vim.keymap.set('n', 'q', ':close<CR>', { buffer = true })
end)

-- local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
map('n', '<Space>tt', '<Cmd>ToggleTerm<CR>i', { desc = 'Toggle Term' })
map('t', '<Esc><Esc>', '<C-\\><C-n><Cmd>ToggleTerm<CR>', { desc = 'Exit terminal mode' })
