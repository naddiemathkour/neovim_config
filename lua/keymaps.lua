-- Leader
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })

-- NeoTree
vim.api.nvim_set_keymap('n', '<c-t>', ':Neotree<CR>', { noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true})

-- Movement
vim.api.nvim_set_keymap('n', '<C-j>', ':JumpLines 10<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':JumpUp 10<CR>', { noremap = true, silent = true})

-- Terminal
vim.api.nvim_set_keymap('n', '<Leader>t', ':sp<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', ':q', [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', ':h', '<C-\\><C-n>:hide<CR>', { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-t>l', ':tabmove +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-t>h', ':tabmove -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tl', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'th', ':tabprevious<CR>', { noremap = true, silent = true })

-- Windows
vim.api.nvim_set_keymap('n', '<Leader>wv', ':vsp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>k', { noremap = true, silent = true })
