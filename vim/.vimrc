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

"""" window/general/commands
"""" s as prefix
nnoremap <silent> ss : w <CR>
nnoremap <silent> sbs : w !sudo tee % <CR>
nnoremap <silent> sbd : bdelete <CR>
nnoremap <silent> sws : vnew  <bar> : Files <CR>
nnoremap <silent> swh : new <bar> : Files <CR>

"""" search/move through text/files/buffers/tree/tags/FZF
"""" \ as prefix
nnoremap <silent> \f : Files <CR>
nnoremap <silent> \b : Buffers <CR>
nnoremap <silent> \l : Lines <CR>
nnoremap <silent> \r : call RangeChooser() <CR>

"""" work with code/text
"""" <Space> as prefix
nnoremap <silent> <Space>y "+y
vnoremap <silent> <Space>y "+y
nnoremap <silent> <Space>ps "+p
vnoremap <silent> <Space>ps "+p
nnoremap <silent> <Space>pp "*p
nnoremap <silent> <Space>p0 "0p
vnoremap <silent> <Space>p0 "0p

"""" some unimpaired stuff - cycle through 
"""" [] as prefix
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
nnoremap <silent> [e : <C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> ]e : <C-U>call <SID>Move('+',v:count1,'Down')<CR>
noremap  <silent> [e : <C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> ]e : <C-U>call <SID>MoveSelectionDown(v:count1)<CR>
nnoremap <silent> [<Space> : <C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> ]<Space> : <C-U>call <SID>BlankDown(v:count1)<CR>


"""""""""" functions go here

" ranger integration from here:  https://github.com/ranger/ranger/blob/master/examples/vim_file_chooser.vim
function! RangeChooser()
    let temp = tempname()
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction

"plugins partial copy/paste of functions from vim-unimpaired
function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
endfunction

function! s:ExecMove(cmd) abort
  let old_fdm = &foldmethod
  if old_fdm !=# 'manual'
    let &foldmethod = 'manual'
  endif
  normal! m`
  silent! exe a:cmd
  norm! ``
  if old_fdm !=# 'manual'
    let &foldmethod = old_fdm
  endif
endfunction

function! s:Move(cmd, count, map) abort
  call s:ExecMove('move'.a:cmd.a:count)
  silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! s:MoveSelectionUp(count) abort
  call s:ExecMove("'<,'>move'<--".a:count)
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
  call s:ExecMove("'<,'>move'>+".a:count)
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)

endfunction

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
