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
  use 'hrsh7th/nvim-cmp'              -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'            -- Buffer completion source
  use 'hrsh7th/cmp-path'              -- Path completion source
  use 'hrsh7th/cmp-cmdline'           -- Command-line completion source
  use 'hrsh7th/cmp-nvim-autopairs'    -- Autopairs integration
  use 'saadparwaiz1/cmp_luasnip'      -- Snippet completion source
  use 'L3MON4D3/LuaSnip'              -- Snippet engine
  use 'windwp/nvim-ts-autotag'        -- Auto-closing HTML tags
end)

-- NeoTree Configuration
require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        -- Auto close NeoTree when a file is opened
        require("neo-tree.command").execute({ action = "close" }) -- Change to "close" if wanted
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

-- cmp and luasnip
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- For snippet expansion
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next item
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous item
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm on Enter
  },
  sources = {
    { name = 'nvim_lsp' },          -- LSP source
    { name = 'nvim-autopairs' },    -- Autopairs source
    { name = 'luasnip' },            -- Snippet source
    { name = 'buffer' },             -- Buffer source
    { name = 'path' },               -- Path source
  },
}
