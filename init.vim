call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch', {'branch': 'release'}
Plug 'tpope/vim-pathogen', {'branch': 'main'}
Plug 'vim-scripts/errormarker.vim'
Plug 'Shatur/neovim-ayu'
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


set makeprg=g++-11\ -std=c++17\ -o\ %:r\ %\
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F10> :vertical terminal ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>
execute pathogen#infect()
