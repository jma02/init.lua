require('plugins')

require('ayu').setup({
    mirage = true, 
})

-- Theme
require('ayu').colorscheme()

-- Status Line
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme="ayu_mirage",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
    }
}

-- LSP Installer
require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')
local root_pattern = require('lspconfig/util').root_pattern

lspconfig.clangd.setup{
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    single_file_support = true,
    root_dir = root_pattern('compile_flags.txt'),
}

lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
        }
      }
    }
  }
}

lspconfig.rust_analyzer.setup {}
-- Load snippets defined in ./LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  
-- Fuzzy Finder
require('telescope').setup{
    extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- TODO: create executor map (probably won't need more than this)
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    python = "python3 -u",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    cpp = {
        "cd $dir &&",
        "g++-13 $fileName -o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt"
    }
  },
})

vim.keymap.set('n', '<F9>', ':Telescope file_browser<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<F10>', ':RunFile<CR>', { noremap = true, silent = false })

--- VimTeX
vim.g.vimtex_view_method = "skim"

-- This is necessary for VimTeX to load properly. The "indent" is optional.
vim.cmd('filetype plugin indent on')

-- Vim settings
vim.opt.relativenumber = true
vim.opt.cindent = true
vim.opt.showmatch = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.syntax = 'on'
vim.opt.wrap = false

vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', { noremap = true })
vim.api.nvim_set_keymap('i', '{;<CR>', '{<CR>};<ESC>O', { noremap = true })

-- Turn spellcheck off by default
vim.opt.spell = false

-- Set spelllang for .tex and .md files
vim.api.nvim_exec([[
  autocmd FileType tex,md setlocal spell spelllang=nl,en_gb
]], false)

-- Map <C-l> to clear and reapply spelling
vim.api.nvim_set_keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true })

-- Template files
vim.cmd([[
  autocmd BufNewFile *.cpp 0r ~/.config/nvim/template.cpp
  autocmd BufNewFile *.tex 0r ~/.config/nvim/template.tex
]])

