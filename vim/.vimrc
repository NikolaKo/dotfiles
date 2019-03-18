
"""""""""" settings go here
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


"""""""""" shortcuts go here
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" window/general/commands
nnoremap <silent> sw : w <CR>
nnoremap <silent> sbs : w !sudo tee % <CR>
nnoremap <silent> sbd : bdelete <CR>

" search/move through text/files/buffers/tree/tags/etc
" FZF stuff
nnoremap <silent> \f : Files <CR>
nnoremap <silent> \b : Buffers <CR>
nnoremap <silent> \l : Lines <CR>

" some unimpaired stuff
nnoremap <silent> [b : bprevious <CR>
nnoremap <silent> ]b : bnext <CR>
nnoremap <silent> [B : bfirst <CR>
nnoremap <silent> ]B : blast <CR>
nnoremap <silent> [t : tprevious <CR>
nnoremap <silent> ]t : tnext <CR>
nnoremap <silent> [T : tfirst <CR>
nnoremap <silent> ]T : tlast <CR>
nnoremap <silent> [w <C-W>W 
nnoremap <silent> ]w <C-W>w 




"""""""""" plugins go here
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'romainl/vim-cool'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()


"""""""""" colorschemes go here
colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_underline = '1'
let g:gruvbox_undercurl = '1'
set background=dark
