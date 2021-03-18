"
" Configuration file for vim
"
set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

filetype on

autocmd ColorScheme * hi LineNr       ctermfg=141                        cterm=none
autocmd ColorScheme * hi CursorLineNr ctermfg=magenta
"autocmd ColorScheme * hi CursorLineNr ctermfg=cyan
augroup InsertHook
  autocmd!
  autocmd InsertLeave * hi LineNr ctermfg=141
  autocmd InsertEnter * hi LineNr ctermfg=lightgreen
augroup END 

autocmd ColorScheme * hi Visual                          ctermbg=magenta cterm=none
autocmd ColorScheme * hi VisualNOS                       ctermbg=magenta cterm=none
autocmd ColorScheme * hi Search       ctermfg=yellow     ctermbg=cyan    cterm=none
autocmd ColorScheme * hi IncSearch    ctermfg=yellow     ctermbg=cyan    cterm=none
autocmd ColorScheme * hi MatchParen   ctermfg=magenta    ctermbg=none

autocmd ColorScheme * hi TabLineSel   ctermfg=lightgreen ctermbg=blue    cterm=none
autocmd ColorScheme * hi TabLine      ctermfg=lightblue  ctermbg=27      cterm=none
autocmd ColorScheme * hi TabLineFill                     ctermbg=27      cterm=none

autocmd ColorScheme * hi StatusLine   ctermfg=lightblue  ctermbg=33      cterm=none
autocmd ColorScheme * hi EndOfBuffer  ctermfg=cyan                       cterm=none

autocmd ColorScheme * hi Pmenu        ctermfg=lightgreen ctermbg=blue
autocmd ColorScheme * hi PmenuSel     ctermfg=cyan       ctermbg=magenta cterm=bold

autocmd ColorScheme * hi ErrorMsg     ctermfg=magenta    ctermbg=none    cterm=none
autocmd ColorScheme * hi WarningMsg   ctermfg=magenta    ctermbg=none    cterm=none

autocmd ColorScheme * hi NonText      ctermfg=25         ctermbg=none    cterm=none
autocmd ColorScheme * hi SpecialKey   ctermfg=25         ctermbg=none    cterm=none

autocmd ColorScheme * hi Comment      ctermfg=14     ctermbg=none   cterm=none

autocmd ColorScheme * hi netrwDir      ctermfg=lightgreen
autocmd ColorScheme * hi netrwTreeBar  ctermfg=lightgreen
autocmd ColorScheme * hi netrwClassify ctermfg=lightgreen
autocmd ColorScheme * hi netrwComment  ctermfg=14     ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwList     ctermfg=yellow ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwVersion  ctermfg=130    ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwHelpCmd  ctermfg=130    ctermbg=none   cterm=none

autocmd BufNewFile,BufRead *.script     set filetype=lua
autocmd BufNewFile,BufRead *.gui_script set filetype=lua

syntax on
colorscheme koehler

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%

set incsearch
set hlsearch
set ignorecase smartcase

set number
set list
set cursorline

set autoindent
"set expandtab " indent tab を space にする
set tabstop=4    " 2
set shiftwidth=4 " 2

filetype indent on
autocmd FileType text setlocal sw=2 sts=2 ts=2 et

set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " 改行にカーソルをおける
set virtualedit+=block  " 矩形選択で行末以降にカーソル移動可
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""
set showtabline=2
set wildmenu " ?
"set showmatch
"set visualbell

"set clipboard+=unnamedplus " neovim ?

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
set statusline+=%{&fileencoding}\  " file encoding
set statusline+=%y\                " file type
set statusline+=%p%%\              " 行数の%
set statusline+=%l/%L              " 現在行数/全行数
"set statusline^=%{coc#status()}   " coc.vim
set laststatus=2   " 0: off  1: on 2 win  2: on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I

packadd Cfilter


" leader key
let mapleader = "\<esc>"
"let mapleader = "\<space>"

"
" mode normal
"

" quit
nnoremap w  :q<cr>
nnoremap :q :q!

" quit other
nnoremap W :tabo<cr>

" save
nnoremap a :w<cr>

" reload
nnoremap :e :e!

" open latest
"nnoremap ?? `0

" open latest list
nnoremap <leader>l :Latest<cr>
"nnoremap :l :Latest<cr>
command! -nargs=0 Latest
\ call setqflist([], ' ', {'lines' : v:oldfiles, 'efm' : '%f',
\                          'quickfixtextfunc' : 'QfOldFiles'}) | tab cw
func QfOldFiles(info)
  " info frm quickfix
  let items = getqflist({'id' : a:info.id, 'items' : 1}).items
  let l = []
  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    " mod file-name simple
    call add(l, fnamemodify(bufname(items[idx].bufnr), ':p:.'))
  endfor
  return l
endfunc


"
" cursor mv
"

" cursor mv dir
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <c-k> 10k
nnoremap <c-j> 10j

" cursor mv line in | ins line
nnoremap <expr> ; col(".") == 1 ? "O<esc>" : col(".") == col("$") ? "0" : "$l"

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-o> h

" cursor mv word - forward
nnoremap f el

" cursor mv word - back
nnoremap o b

" cursor mv file
nnoremap gk gg0
nnoremap gl gg0
nnoremap gj G$l

" cursor mv bracket paire
nnoremap <c-l> %

" cursor mv bracket back
nnoremap u [{

" cursor mv edited ( jump list )
nnoremap _     <c-o>
nnoremap <c-_> <c-i>

" cursor mv window split
nnoremap <c-w> <c-w>w
"nnoremap @     <c-w>w

" scroll
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" scroll cursor line read easily
nnoremap <c-e>  zz10<c-e>
"nnoremap <c-e>  10<c-e>

"
" edit
"

" ins
nnoremap i i
"nnoremap e i

" ins line
" ref ;

" ins cr
nnoremap m i<cr><esc>

" del char
nnoremap s "ax
nnoremap x x
"nnoremap <bs> h"ax

" del line
nnoremap d "0dd

" del in line forward
nnoremap <c-f> D
"nnoremap cc D

" del word back
"nnoremap <c-w> hvbd

" del word forward
"nnoremap <expr> <c-d> col(".") == col("$") ? "<esc>" : '"adw'
"nnoremap <expr> <c-s> col(".") == col("$") ? "<esc>" : '"ade'

" del cr ( line join )
nnoremap <c-m> J

" select all
nnoremap A ggVG

" select word
nnoremap <space>   viw
nnoremap <c-space> v
"nnoremap e viw
"nnoremap E v
"nnoremap i viw
"nnoremap I v

" select box
nnoremap v <c-v>

" yank
nnoremap c "0yy

" paste
nnoremap p "0P

" undo, redo
nnoremap h u
nnoremap <c-h> <c-r>

" repeat
"nnoremap . .

" inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap > >>
nnoremap < <<

"
" search
"

" search char
"nnoremap e t
"nnoremap <esc> t

" search
nnoremap n     n
nnoremap <c-n> N
nnoremap /     /
nnoremap e     g*N
nnoremap E     *N
"nnoremap r     g*N
"nnoremap R     *N

" search replace > yank all ( file )
nnoremap :s :%s//<c-r>0/gc<cr>
"nnoremap :w :%s//<c-r>0/g <cr>

" search replace > yank one , next
"nnoremap <c-p> nviw
nnoremap <c-p> :call SrchSlct()<cr>

" tag jump
nnoremap t <c-w>gFgT
"nnoremap t <c-w>gF

" mark
"nnoremap b m
"nnoremap @ m

"
" tab
"
nnoremap <Tab>   gt
nnoremap <S-Tab> gT
nnoremap <S-Right> :tabm+1<Cr>
nnoremap <S-Left>  :tabm-1<Cr>

" buffers
"nnoremap :b :buffers

"
" esc
"
"nnoremap <esc>   <esc>
"nnoremap <space> <esc>
nnoremap <bs>    <esc>

"nnoremap @ <esc>
"nnoremap ; <esc>
nnoremap , <esc>
nnoremap . <esc>
nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>

"nnoremap <c-space> <esc>
nnoremap <c-@> <esc>

"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

nnoremap 0 <esc>
"nnoremap a <esc>
nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap o <esc>
nnoremap q <esc>
nnoremap r <esc>
"nnoremap s <esc>
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
"nnoremap x <esc>
nnoremap y <esc>
nnoremap z <esc>

nnoremap O <esc>
nnoremap T <esc>

nnoremap <c-a> <esc>
nnoremap <c-b> <esc>
nnoremap <c-c> <esc>
nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
"nnoremap <c-f> <esc>
nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
"nnoremap <c-p> <esc>
nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"noremap <c-w> <esc>
nnoremap <c-x> <esc>
nnoremap <c-y> <esc>
nnoremap <c-z> <esc>


"
" mode visual
"

" mode ch line , ins
vnoremap <space> V
"vnoremap e V
"vnoremap i V

" mode ch box
vnoremap v <c-v>

"
" cursor mv
"

" cursor mv char
vnoremap l l
vnoremap h h
"vnoremap <c-o> h

" cursor mv word - forward
vnoremap f e
vnoremap F el

" cursor mv word - back
vnoremap <c-o> b
"vnoremap o b

" cursor mv in selected
vnoremap ; o

" cursor mv in line
"vnoremap <expr> ; col(".") == col("$") ? "0" : "$"

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv file
vnoremap gk gg0
vnoremap gl gg0
vnoremap gj G$l
"vnoremap gg gg

" cursor mv bracket
vnoremap <c-l> %

" ins | cut & ins
vnoremap <expr> i mode() == "<c-v>" ? "I" : "c"
vnoremap I c
"vnoremap <expr> e mode() == "<c-v>" ? "I" : "c"
"vnoremap E c

" ins $
vnoremap <expr> $ mode() == "<c-v>" ? "$A" : "$"

" del str
vnoremap s "0x
vnoremap x "0x

" del line
vnoremap d "0d

" del cr
vnoremap <c-m> J

" yank
vnoremap o "0y
vnoremap c "0y

" yank to pc clipboard
vnoremap :c :!pbcopy<cr>u
"vnoremap :c :!pbcopy;pbpaste 

" paste
vnoremap p "ad"0P

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" indent
vnoremap > >gv
vnoremap < <gv

" indent tab > space
vnoremap :t :!expand -t 4

" upper / lower
vnoremap u     ~viw
vnoremap <c-u> uviw

"
" search
"
vnoremap n "ay/<c-r>a<cr>N
"vnoremap n "ay/<c-r>a<cr>
vnoremap / "ay/<c-r>a
vnoremap e "ay/<c-r>a<cr>N
vnoremap E *<c-c>N
"vnoremap r "ay/<c-r>a<cr>N
"vnoremap R *<c-c>N

" search replace > yank all ( selected )
vnoremap :s :s//<c-r>0/gc<cr>
"vnoremap :w :s//<c-r>0/g <cr>

" search replace > yank one , next
"vnoremap <c-p> "ad"0Pnviw
vnoremap <c-p> "ad"0P:call SrchSlct()<cr>

" tag jump
"vnoremap t <c-w>gF

"
" esc
"
"vnoremap <space> <nop>
vnoremap @ <c-c>
vnoremap * <c-c>

vnoremap a <c-c>
vnoremap b <c-c>
"vnoremap c <c-c>
"vnoremap d <c-c>
vnoremap e <c-c>
"vnoremap h <c-c>
"vnoremap i <c-c>
"vnoremap o <c-c>
vnoremap q <c-c>
vnoremap r <c-c>
"vnoremap s <c-c>
"vnoremap t <c-c>
"vnoremap u <c-c>
vnoremap w <c-c>
"vnoremap x <c-c>
vnoremap y <c-c>

vnoremap <c-a> <c-c>
vnoremap <c-e> <c-c>
vnoremap <c-f> <c-c>
"vnoremap <c-l> <c-c>
"vnoremap <c-m> <c-c>
vnoremap <c-n> <c-c>
"vnoremap <c-o> <c-c>
"vnoremap <c-p> <c-c>
vnoremap <c-q> <c-c>
vnoremap <c-s> <c-c>
"vnoremap <c-u> <c-c>
vnoremap <c-v> <c-c>
vnoremap <c-w> <c-c>
vnoremap <c-x> <c-c>


"
" mode insert
"

" cursor mv line in
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <expr> <c-o> pumvisible() ? "<c-y>" : "<c-o>h"
"inoremap <c-o> <c-o>h

" cursor mv word
inoremap <c-f> <c-o>e<c-o>l
"inoremap <c-q> <c-o>b

" ins bracket
"inoremap < <><c-o>h
inoremap [ []<c-o>h
inoremap ( ()<c-o>h
inoremap { {}<c-o>h
inoremap ' ''<c-o>h
inoremap <expr> " col(".") == 1 ? "\"" : "\"\"<c-o>h"

" del line
" non

" del char forward
inoremap <c-d> <c-o>x
inoremap <c-s> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-o>dw"

" line new
inoremap <c-m> <cr>
"inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<cr>"

" tab
inoremap <tab> <c-v><Tab>

" input complete
inoremap <expr> <c-j> pumvisible() ? "<c-n>"  : "<c-n>"
inoremap <expr> <c-n> pumvisible() ? "<down>" : "<c-o>j"
inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<c-o>k"
inoremap <expr> <c-w> pumvisible() ? "<c-e>"  : "<c-w>"
"inoremap <c-m> <c-n>

" quit, esc
"inoremap <c-;> <esc> " non
inoremap <esc> <esc>
inoremap <c-c> <esc>
"inoremap <c-f> <esc>
inoremap <c-q> <esc>

" 
" mode ex
" 
" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

" cursor mv char
cnoremap <c-b> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <S-Left>
cnoremap <c-f> <S-Right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word forward
cnoremap <c-k> <S-Right><c-w>

" del line in back
cnoremap <c-c> <c-u>

"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end


" 
" ripgrep ( cmd )
" 
if executable('rg')
  let &grepprg = 'rg --vimgrep -s -g "*.lua" -g "*.script" -g "*.gui_script"'
  set grepformat=%f:%l:%c:%m
endif
nnoremap :g :grep! "<c-r>/"

"command! -nargs=1 Ripgrep grep! "<args>"
"nnoremap :r :Ripgrep <c-r>/


" 
" vimgrep
" 
command! -nargs=1 V  vimgrep   /<args>/j **/*.lua **/*.script **/*.gui_script
nnoremap :v :V <c-r>/

command! -nargs=1 VC vimgrep /\C<args>/j **/*.lua **/*.script **/*.gui_script
nnoremap :V :VC <c-r>/


"
" quickfix
"
autocmd QuickFixCmdPost vimgrep,grep tab cw


"
" netrw
"

" launch
nnoremap <leader>k :Tex .<cr>

let g:netrw_liststyle    = 3 " view file tree
let g:netrw_browse_split = 3 " file open tab
let g:Netrw_UserMaps = [
\ ['<c-o>'    , 'NetrwKeyBind_opn'],
\ ['<c-l>'    , 'NetrwKeyBind_opn'],
\ ['o'        , 'NetrwKeyBind_mv_word_back'],
\ ['e'        , 'NetrwKeyBind__top'],
\ ['p'        , 'NetrwKeyBind__parent'],
\ ['<c-q>'    , 'NetrwKeyBind_clz'],
\]

func! NetrwKeyBind_opn (islocal) abort
  return "normal  \<cr>"
endfunc
func! NetrwKeyBind_clz (islocal) abort
  return "normal  :q\<cr>"
endfunc
func! NetrwKeyBind_mv_word_back (islocal) abort
  return "normal! b"
endfunc
func! NetrwKeyBind__top (islocal) abort
  return "Ntree"
endfunc
func! NetrwKeyBind__parent (islocal) abort
  return "normal  -"
endfunc


" 
" plugin  #bgn#
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = { 'ctrl-o': 'tab drop' }

let g:fzf_colors = {
\   'hl'     : ['fg', 'Statement'  ],
\   'hl+'    : ['fg', 'Statement'  ],
\ }

"\   'bg+'    : ['bg', 'CursorLine' ],
"\   'bg+'    : ['bg', 'Normal'     ],

"\   'info'   : ['fg', 'Comment'    ],
"\   'border' : ['fg', 'Ignore'     ],
"\   'prompt' : ['fg', 'Function'   ],
"\   'pointer': ['fg', 'Statement'  ],
"\   'marker' : ['fg', 'Conditional'],

"\   'info'   : ['Comment'],
"\   'border' : ['Comment'],
"\   'prompt' : ['Comment'],
"\   'pointer': ['Comment'],
"\   'marker' : ['Comment'],

"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" lines
nnoremap <leader>j :BLines<cr>
vnoremap <leader>j "ay:BLines <c-r>a<cr>
"nnoremap <leader>u :BLines<cr>
"vnoremap <leader>u "ay:BLines <c-r>a<cr>
command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(<q-args>,{'options': ['--no-sort']}, <bang>1)

" files
nnoremap <leader>i :Files <cr>
vnoremap <leader>i :Files <cr>
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" rg ( fzf )
"
" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )
nnoremap <leader>o :Rg <cr>
vnoremap <leader>o "ay:Rg <c-r>a<cr>
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg 
\     --line-number --smart-case --no-multiline --no-heading --color=always 
\     -- '.shellescape(<q-args>),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

"
" ctags ( fzf )
"
set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap ?? :!sh sh/ctags.sh

"nnoremap <leader>?? :Tags <c-r><c-w><cr>
"vnoremap <leader>?? "ay:Tags <c-r>a<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)

" plugin  #end#


"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o

"
" vim script
"

func! s:FileJmp() range abort

  let l:files = []

  for line_idx in range(a:firstline, a:lastline)

    let l:line = getline(line_idx)
	let l:idx1 = stridx(l:line, " ")
    if l:idx1 > 0
      let l:file_num  = strpart(l:line, 0, l:idx1)
    else
      let l:file_num  = l:line
    endif

    call add(l:files, l:file_num)

  endfor

  "call uniq(sort(l:files))

  for file_num in l:files

    let l:idx1 = stridx(l:file_num, "|")

    if l:idx1 > 0
      let l:file = strpart(l:file_num,          0, l:idx1)
      let l:num  = strpart(l:file_num, l:idx1 + 1)
    else
      let l:file = l:file_num
      let l:num  = "1"
    endif

    execute "tab drop " . l:file
    execute "normal! " . l:num . "G"
    
  endfor

endfunc
command! -range=% -nargs=0 FileJmp :<line1>,<line2>call s:FileJmp()
vnoremap :f :FileJmp<cr>
nnoremap :f :Cfilter
"nnoremap :c :Cfilter


func! SrchSlct() abort
  
  let l:len_mv = strchars( @/ ) - 1
  execute "normal! nv" . l:len_mv . "l"

endfunc


