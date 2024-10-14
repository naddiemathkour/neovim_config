-- Plugins
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is installed
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

  -- Packages
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",  -- optional
      "MunifTanjim/nui.nvim",
    }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'windwp/nvim-autopairs'
end)

-- NeoTree Configuration
require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        -- Auto close NeoTree when a file is opened
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  },
  window = {
    width = 25,
    position = 'left',
  }
})

-- Autopairs Setup
require("nvim-autopairs").setup{}

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",  -- Install all parsers
  highlight = {
    enable = true,            -- Enable syntax highlighting
  },
}
