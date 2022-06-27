call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch', {'branch': 'release'}
Plug 'tpope/vim-pathogen', {'branch': 'main'}
Plug 'vim-scripts/errormarker.vim'
Plug 'andweeb/presence.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Shatur/neovim-ayu'
Plug 'arcticicestudio/nord-vim'

call plug#end()
colorscheme ayu-mirage
set number
set cindent
set showmatch
set softtabstop=4
set shiftwidth=4
set expandtab
set termguicolors
syntax on
set expandtab
set nowrap
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

autocmd BufNewFile *.cpp 0r ~/.config/nvim/template.cpp

set makeprg=g++-11\ -std=c++17\ -o\ %:r\ %\
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F10> :vert terminal ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>
execute pathogen#infect()
