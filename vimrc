if has("gui_running")
    set guifont=Monospace\ 10
    set lines=50
    set columns=100
    colorscheme desert
else
    set background=dark
endif

set nowrap
set background=dark
set laststatus=2
set nomousehide
set expandtab
set tabstop=4
set shiftwidth=4
syntax on

if has("mouse")
    set mouse=a
endif

function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

function! GotoDefinition()
  let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
endfunction
map <F4> :call GotoDefinition()<CR>
imap <F4> <c-o>:call GotoDefinition()<CR>


autocmd BufWritePre *.py :%s/\s\+$//e

" move through files
map <F11> :bp
map <F12> :bn
map <F10> :set expandtab <CR> :retab<CR>


" Settings for taglist plugin.  Note that something like 
" au BufNewFile,BufRead *.pcpp set filetype=cpp
" is necessary to make taglist work for .pcpp files.
"
" You'll also need to include '--langmap=c++:+.pcpp' in your ~/.ctags file.
"
map <F6> :Tlist
let Tlist_Sort_Type = "name"
let Tlist_Show_One_File = 1

"Plugin 'vim-make-syntax'
