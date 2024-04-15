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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
map('n', '<C-\\>', function()
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

-- move between tabs
map('n', '<A-1>', ':tabprevious<CR>')
map('n', '<A-2>', ':tabnext<CR>')
map('n', '<A-3>', ':tabnew<CR>')
map('n', '<A-4>', ':tabclose<CR>')
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
