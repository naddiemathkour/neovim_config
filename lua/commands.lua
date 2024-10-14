-- Command to jump down x lines
vim.api.nvim_create_user_command('JumpLines', function(opts)
    local lines = tonumber(opts.args) or 0
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(lines) .. 'j', true, false, true), 'n', true)
end, { nargs = 1, complete = 'customlist,v:lua.vim.fn.getline' })

-- Command to jump up x lines
vim.api.nvim_create_user_command('JumpUp', function(opts)
    local lines = tonumber(opts.args) or 0
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(lines) .. 'k', true, false, true), 'n', true)
end, { nargs = 1, complete = 'customlist,v:lua.vim.fn.getline' })
