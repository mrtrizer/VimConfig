" Move through splitted areas
:tnoremap <C-q> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Fuzzy search in history
noremap <space> :CtrlPMRU<CR>

" Color scheme
source ~/.config/nvim/vylight.vim

" Fix wrong braces highlight
hi CursorLine guifg=NONE guibg=#eeee00 guisp=#eeeeee gui=NONE ctermfg=NONE ctermbg=25 cterm=NONE
hi MatchParen cterm=none ctermbg=none ctermfg=red

" Switch between header/source
nmap ,s :find %:t:r.cpp<CR>
nmap ,S :sf %:t:r.cpp<CR>

nmap ,h :find %:t:r.h<CR>
nmap ,H :sf %:t:r.h<CR>

" Switch between ranger and editor
nnoremap <C-o> :buffer 1<CR>i
nmap <S-Tab> ,w
tmap <S-Tab> <C-q>,w

" Fast move
nmap <C-j> 10j
nmap <C-k> 10k

function! ConfirmQuit(writeFile)
    if (a:writeFile)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        :write
    endif

    if (winnr('$')==1 && tabpagenr('$')==1)
        if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
            :quit
        endif
    else
        :quit
    endif
endfu

cnoremap <silent> q<CR>  :call ConfirmQuit(0)<CR>
cnoremap <silent> x<CR>  :call ConfirmQuit(1)<CR>

function! OnSwitchWindow()
    if &buftype ==# 'terminal'
        startinsert
    endif
endfu

autocmd WinEnter * :call OnSwitchWindow()
autocmd BufEnter * :call OnSwitchWindow()

" Commentary style
:setlocal commentstring=//\ %s
:set smartcase
