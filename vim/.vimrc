set wildignore+=node_modules
set wildignore+=vendor
set wildmenu
set path+=**

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=0
set background=light
syntax on
filetype on
filetype indent on
filetype plugin on
set hls
set ignorecase
set smartcase
set undofile
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set sessionoptions-=option

" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif


set smarttab
set complete-=i



if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if &history < 1000
  set history=1000
endif



set autoread

"set scrolljump=-50

" Disable annoying beeping
set noerrorbells
set vb t_vb=

set t_Co=16
" let xterm16_colormap = 'standard'
" let xterm16_colormap	= 'standard'
" let xterm16_brightness	= 'default'
" colo xterm16
" colorscheme delek
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set autowrite

" returns a string <branch/XX> where XX corresponds to the git status
" (for example "<master/ M>")
function CurrentGitStatus()
    let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')
    if len(gitoutput) > 0
        let b:gitstatus = strpart(get(gitoutput,0,''),3) . '/' . strpart(get(gitoutput,1,'  '),0,2)
    else
        let b:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call CurrentGitStatus()
" example of use in the status line:
"set stl=%f\ 

"set statusline=%F%m%r%h%w\ %(<%{b:gitstatus}>%)
"set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
"set stl+=%y
"set statusline+=\ %l          

set mouse=n
"set ttymouse=sgr "for mouse=a in suckless terminal
map <F2> <Esc>:silent !sudo make clean install<CR> :redraw!<CR>
"
"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>:xdotool! key "shift+Super_L+q"

" set breakindent
" set breakindentopt=shift:2,min:40,sbr
" set showbreak=>>>>>>>>>>>>>>

set noruler

" set nu
