
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set incsearch

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

autocmd QuickFixCmdPost vimgrep,grep tab cwindow
packadd Cfilter

autocmd ColorScheme * highlight LineNr ctermfg=141
autocmd ColorScheme * highlight Visual cterm=none ctermbg=magenta
autocmd ColorScheme * highlight Search cterm=bold ctermfg=Yellow ctermbg=Cyan
autocmd ColorScheme * highlight NonText    ctermbg=None ctermfg=25
autocmd ColorScheme * highlight SpecialKey ctermbg=None ctermfg=25
autocmd ColorScheme * highlight MatchParen ctermbg=lightmagenta ctermfg=lightgreen

autocmd ColorScheme * highlight TabLineFill                   ctermbg=27
autocmd ColorScheme * highlight TabLine     ctermfg=LightBlue ctermbg=27
autocmd ColorScheme * highlight TabLineSel  ctermfg=Lightmagenta ctermbg=blue

autocmd ColorScheme * highlight StatusLine ctermfg=lightblue ctermbg=33

colorscheme koehler
"colorscheme evening

set hlsearch
"hi search ctermbg=lightyellow
"hi matchparen ctermfg=red ctermbg=6

set number
set list
set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
"hi nontext    ctermbg=none ctermfg=59 guibg=none guifg=none
set cursorline

set autoindent
set expandtab " space にしたい場合は有効にする
set tabstop=2
set shiftwidth=2
set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore "改行にカーソルをおける
set virtualedit+=block  "矩形選択で行末以降にカーソル移動可
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""

set clipboard+=unnamed
syntax on

set statusline=%F  " file name 表示
set statusline+=%m " 変更あり表示
set statusline+=%= " 以降を右寄せ
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L]            " 現在行数/全行数
set laststatus=2   " 0: off  1: on 2 win  2: on


"
" mode normal ( command )
"

" quit
nnoremap <C-q> :q<Cr>

" save
nnoremap <C-s> :w<Cr>

" tag jump
"nnoremap t <C-w>gf
nnoremap t <C-w>gF:tabm<Cr>

" insert
"nnoremap k i
"nnoremap e i
nnoremap a A
nnoremap e A
nnoremap o O<Esc>
nnoremap <Space> i<Space><Esc>l
"nnoremap <C-j> i<Cr><Esc>
"nnoremap <Cr> i<Cr><Esc>

" yank
nnoremap c yy

" paste
nnoremap p P
nnoremap v P

" del
nnoremap s "ax
nnoremap <C-d> x
nnoremap <BS> x
nnoremap <C-h> hx
nnoremap d dd
nnoremap cc cc<Esc>
nnoremap <C-m> i<Cr><Esc>
"nnoremap dd "add
nnoremap <C-w> hvbd

" char replace
nnoremap <C-r> r

" redo
nnoremap r <C-r>

" repeat
nnoremap m .

" select
"nnoremap <C-q> v

" select all
nnoremap <C-@> ggvG

" select word
nnoremap w viw
"nnoremap <C-w> v
nnoremap W V

" select box
"nnoremap x <C-v>

" cursor mv
"nnoremap i k

" cursor mv line
nnoremap <C-k> 10k
"nnoremap <C-i> 10k
nnoremap <C-j> 10j
nnoremap <C-g> G
nnoremap <C-l> %

"nnoremap <C-u> zt3<C-y>
"nnoremap <C-l> zt3<C-y>

" cursor mv word
nnoremap <C-a> 0
nnoremap <C-e> $l
"nnoremap <C-f> l
nnoremap <C-o> h
nnoremap f l

nnoremap <C-b> b
nnoremap <C-f> w
"nnoremap <C-l> e


" search
"nnoremap <C-n> N
"nnoremap * Viw"by/<C-r>"

" tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-Right> :tabm+1<Cr>
nnoremap <S-Left>  :tabm-1<Cr>

" increment
nnoremap + <C-a>
nnoremap - <C-x>

" indent
nnoremap > >>
nnoremap < <<

" grep
nnoremap :g :grep! "" **.lua **.script<Home><S-Right><Right><Right>
"nnoremap f :grep! "" **.lua **.script<Home><S-Right><Right><Right>


"
" mode insert
"
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-k> <C-o>D
inoremap <C-d> <C-o>x
inoremap <C-l> <C-o>l
inoremap <C-b> <C-o>b
inoremap <C-o> <C-o>h
inoremap <C-f> <C-o>w

inoremap <C-p> <C-o>k
inoremap <C-n> <C-o>j

"inoremap <C-v> <C-v><Tab>
inoremap <Tab> <C-v><Tab>

inoremap <C-q> <Esc>
inoremap <C-c> <Esc>
inoremap <C-s> <Esc>

"inoremap <C-i> <C-n>
"inoremap <C-b> <C-p>


"
" mode visual
"
vnoremap <C-q> <C-c>
vnoremap q <C-c>

vnoremap i I
vnoremap a A

vnoremap <C-a> 0
vnoremap <C-e> $
vnoremap <C-h> b
vnoremap <C-l> e
vnoremap <C-g> G

vnoremap <C-j> 10j
vnoremap <C-k> 10k

vnoremap w V
vnoremap <C-w> <C-v>

" del
"vnoremap s "ax
vnoremap s x
vnoremap x "ax

" yank
vnoremap c y

" paste
vnoremap p "adhp
vnoremap v "adhp

" increment
"vnoremap + <C-a>
vnoremap + g<C-a>

" indent
vnoremap > >gv
vnoremap < <gv
vnoremap :t :'<,'>!expand -2

" add
vnoremap i" di""<C-c>hp
vnoremap i' di''<C-c>hp
vnoremap i( di()<C-c>hp
vnoremap i{ di{}<C-c>hp
vnoremap i< di<><C-c>hp


" 
" mode ex  -  command line ?
" 
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"cnoremap <C-b> <Left>
cnoremap <C-o> <Left>
cnoremap <C-f> <Right>
cnoremap <C-l> <S-Right>
cnoremap <C-d> <Del>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
cnoremap <C-q> <C-c>

ab t tabnew

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi LineNr ctermfg=green
  autocmd InsertLeave * hi LineNr ctermfg=141
augroup END 


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif





