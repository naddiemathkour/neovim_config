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
  ensure_installed = { 'pyright', 'ts_ls', 'emmet_ls' }
})

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup{}
lspconfig.ts_ls.setup{}
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {
    "css", "less", "sass", "scss", "html"
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
        ["comment.enabled"] = true,
        ["output.format"] = true,
        ["output.selfClosingStyle"] = "html",
      }
    }
  }
})

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
