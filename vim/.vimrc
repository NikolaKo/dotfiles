
set number
syntax on
set hls
set nrformats=
set shiftwidth=4 softtabstop=4 expandtab
set wildmenu
set wildmode=full
set history=1000
set timeoutlen=1000 ttimeoutlen=10
set hidden

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> [b : bprevious <CR>
nnoremap <silent> ]b : bnext <CR>
nnoremap <silent> [B : bfirst <CR>
nnoremap <silent> ]B : blast <CR>


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'romainl/vim-cool'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_underline = '1'
let g:gruvbox_undercurl = '1'
set background=dark
