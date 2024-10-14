-- NeoTree
vim.api.nvim_set_keymap('n', '<c-t>', ':Neotree toggle<CR>', { noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<CR>', { noremap = true, silent = true})
