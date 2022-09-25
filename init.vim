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
Plug 'lervag/vimtex'

call plug#end()
filetype plugin indent on
let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

augroup vimtex_mac
    autocmd!
    autocmd User VimtexEventCompileSuccess call UpdateSkim()
augroup END

function! UpdateSkim() abort
    let l:out = b:vimtex.out()
    let l:src_file_path = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']

    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif

    call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
endfunction

let g:vimtex_compiler_method = 'latexmk'

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
autocmd BufNewFile *.tex 0r ~/.config/nvim/template.tex

set makeprg=g++-12\ -std=c++17\ -o\ %:r\ %\
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
autocmd filetype cpp nnoremap <F10> :vs<bar>:terminal ./%:r<CR>
autocmd filetype cpp nnoremap <F11> :!./%:r<CR>
execute pathogen#infect()
