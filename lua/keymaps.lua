-- NeoTree
vim.api.nvim_set_keymap('n', '<c-t>', ':Neotree<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<c-t>', ':Neotree toggle<CR>', { noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true})

-- Movement
vim.api.nvim_set_keymap('n', '<C-j>', ':JumpLines 10<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':JumpUp 10<CR>', { noremap = true, silent = true})

-- Terminal
vim.api.nvim_set_keymap('n', '<S-T>', ':sp<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<S-T>', [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })
