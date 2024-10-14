-- Color Scheme

local fn = vim.fn
local execute = vim.api.nvim_command

-- Define install path for Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require 'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

-- Plugin Startup
packer.startup(function(use)
  use 'wbthomason/packer.nvim'  -- Packer can manage itself
  use 'navarasu/onedark.nvim'   -- Atom One Dark theme
end)

-- One Dark Setup
require('onedark').setup {
  style = 'dark',
}

-- Apply the theme
vim.cmd[[colorscheme onedark]]
