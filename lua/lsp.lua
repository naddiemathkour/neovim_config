-- LSP
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                -- Packer can manage itself
  use 'williamboman/mason.nvim'               -- Mason for managing LSP servers
  use 'williamboman/mason-lspconfig.nvim'     -- Integration with lspconfig
  use 'neovim/nvim-lspconfig'                 -- LSP configurations
  use 'hrsh7th/nvim-cmp'                      -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp'                  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'                    -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path'                      -- Path source for nvim-cmp
  use 'hrsh7th/cmp-cmdline'                   -- Cmdline source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'              -- Snippet source for nvim-cmp
  use 'L3MON4D3/LuaSnip'
end)

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'ts_ls' }
})

local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}
lspconfig.ts_ls.setup{}

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- For snippet support
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
