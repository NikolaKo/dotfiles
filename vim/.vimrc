
set number
syntax on
set hls
set nrformats=
set shiftwidth=4 softtabstop=4 expandtab
set wildmenu
set wildmode=full
set history=1000
set timeoutlen=1000 ttimeoutlen=10

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> [b : bprevious <CR>
nnoremap <silent> ]b : bnext <CR>
nnoremap <silent> [B : bfirst <CR>
nnoremap <silent> ]B : blast <CR>
