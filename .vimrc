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

hi LineNr        ctermfg=141                        cterm=none
augroup InsertHook
  au!
  au InsertLeave * hi LineNr ctermfg=141
  au InsertEnter * hi LineNr ctermfg=lightgreen
augroup END 

hi CursorLineNr  ctermfg=magenta

hi Visual                           ctermbg=magenta cterm=none
hi VisualNOS                        ctermbg=magenta cterm=none
hi Search        ctermfg=yellow     ctermbg=cyan    cterm=none
hi IncSearch     ctermfg=yellow     ctermbg=cyan    cterm=none
hi MatchParen    ctermfg=magenta    ctermbg=none

hi TabLineSel    ctermfg=cyan       ctermbg=none    cterm=none
hi TabLine       ctermfg=lightblue  ctermbg=33      cterm=none
hi TabLineFill                      ctermbg=33      cterm=none

hi StatusLine    ctermfg=lightblue  ctermbg=33      cterm=none
hi EndOfBuffer   ctermfg=cyan                       cterm=none

hi Pmenu         ctermfg=lightgreen ctermbg=blue
hi PmenuSel      ctermfg=cyan       ctermbg=magenta cterm=bold

hi ErrorMsg      ctermfg=magenta    ctermbg=none    cterm=none
hi WarningMsg    ctermfg=magenta    ctermbg=none    cterm=none

hi NonText       ctermfg=25         ctermbg=none    cterm=none
hi SpecialKey    ctermfg=25         ctermbg=none    cterm=none

hi Comment       ctermfg=14         ctermbg=none    cterm=none

hi FullWidthSpace ctermbg=white
au VimEnter * match FullWidthSpace /　/

hi netrwDir      ctermfg=lightgreen
hi netrwTreeBar  ctermfg=lightgreen
hi netrwClassify ctermfg=lightgreen
hi netrwComment  ctermfg=14         ctermbg=none    cterm=none
hi netrwList     ctermfg=yellow     ctermbg=none    cterm=none
hi netrwVersion  ctermfg=130        ctermbg=none    cterm=none
hi netrwHelpCmd  ctermfg=130        ctermbg=none    cterm=none

au BufNewFile,BufRead *.script     set filetype=lua
au BufNewFile,BufRead *.gui_script set filetype=lua
au BufNewFile,BufRead *.fish       set filetype=fish

syntax on

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
set incsearch
set hlsearch
set ignorecase smartcase
set number
set list
set cursorline
set splitbelow
set switchbuf=usetab,newtab

set autoindent
set shiftwidth=2 " 4
set tabstop=2    " 4
set expandtab " tab > space

filetype indent on
autocmd FileType lua  setlocal sw=2 sts=2 ts=2 noet " tab
autocmd FileType text setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType json setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType vim  setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType fish setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType sh   setlocal sw=2 sts=2 ts=2   et " space

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" | endif
augroup END

autocmd BufWinEnter * normal! zz
"autocmd BufWinEnter * normal! zt

set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " cursor mv cr
set virtualedit+=block  " box select
"set virtualedit=all
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""
set showtabline=2
set wildmenu " ?
"set showmatch
"set visualbell

"set clipboard+=unnamedplus " ???

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
"set statusline+=%{&fileencoding}\  " file encoding
"set statusline+=%c\                " column num
set statusline+=%y\                " file type
set statusline+=%p%%\              " line num %
set statusline+=%l/%L              " line num / line num all
set laststatus=2                   " 0:off  1:on when 2 win  2:on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I
"set nrformats+=unsigned " 2022-05-09

packadd Cfilter


" 
" leader
" 
let mapleader = "\<esc>"
"let mapleader = "\<space>"


"
" mode normal
"

" quit buffer
nnoremap w :bd<cr>

" quit
nnoremap <c-w> :q<cr>

" quit force
nnoremap <c-q> :q!
"nnoremap :q :q!

" quit other
nnoremap W :tabo<cr>

" save
nnoremap a :w<cr>

" reload
"nnoremap :xx :e!

" opn latest
"nnoremap xx `0

" opn file rcnt ( history )
nnoremap <leader>h :FileHstry<cr>
"nnoremap <leader>y :FileHstry<cr>

" opn tab new
"command! -nargs=* New tabnew <args>
"nnoremap :n :New filename

" opn tab file
nnoremap :e :Opn 
nnoremap :o :Opn 
command! -nargs=* -complete=file Opn call Opn(<q-args>)
func! Opn(filename) abort

  exe 'tab drop ' . a:filename
endfunc

" opn .vimrc
nnoremap gh :call Opn_vimrc()<cr>
func! Opn_vimrc() abort

  call Opn('~/.vimrc')
endfunc

" opn tmp ( grep )
nnoremap gg :call Opn_tmp()<cr>
"nnoremap gu :call Opn_tmp()<cr>
func! Opn_tmp() abort

  call Opn('doc/grep.lua')
endfunc

" opn memo
nnoremap gm :call Opn_memo()<cr>
"nnoremap gi :call Opn_memo()<cr>
func! Opn_memo() abort

  call Opn('doc/memo.txt')
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
nnoremap <c-k> 10<c-y>
nnoremap <c-j> 10<c-e>

" cursor mv in line start | ins line
nnoremap y :call N_cursor_mv_line_start_or_new_line()<cr>

" cursor mv in line start
nnoremap <c-a> 0

" cursor mv in line end
nnoremap <c-y> :call N_cursor_mv_line_end()<cr>
nnoremap <c-e> :call N_cursor_mv_line_end()<cr>

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-s> h
nnoremap <c-o> h

" cursor mv word - forward
nnoremap f :call N_cursor_mv_word_f()<cr>

" cursor mv word - back
nnoremap o :call N_cursor_mv_word_b()<cr>

" cursor mv word - back pre
"nnoremap xx :call N_cursor_mv_word_b_pre()<cr>

" cursor mv word dlm _ forward
nnoremap _ f_l
"nnoremap <c-_> f_l

" cursor mv word dlm _ back
nnoremap <c-_> hT_
"nnoremap _ hT_

" cursor mv bracket pair
nnoremap <c-l> %

" cursor mv bracket back
nnoremap L [m

" cursor mv function back
nnoremap go [{

" cursor mv edited ( jump list )
nnoremap b     <c-o>
nnoremap <c-b> <c-i>

" cursor mv file back    ( file begin )
nnoremap gk gg0

" cursor mv file forward ( file end   )
nnoremap gj G$l

" scroll
nnoremap K      <c-y>
nnoremap J      <c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" scroll cursor line upper
nnoremap <leader>r zt

" scroll cursor line middle
nnoremap <leader>f zz

" cursor mv window nxt
"nnoremap xx <c-w>w

" 
" edit
"

" ins mode
nnoremap <space> i
"nnoremap <esc> i

" ins line
" ref ;

" ins cr
nnoremap m :call N_ins_cr()<cr>

" ins space
"nnoremap xx i <esc>

" ins comma
nnoremap , i, <esc>l

" ins comma $, nxt
nnoremap < A,<esc>j

" ins comment 1
nnoremap ! :call N_cmnt_1()<cr>
"autocmd FileType css  nnoremap ! ^i/* <esc>$li */<esc>0

" ins comment mlt
nnoremap $ :call N_cmnt_mlt()<cr>

" ins date time
nnoremap * i<c-r>=strftime("%Y-%m-%d %a %H:%M:%S")<cr><esc>

" del char
nnoremap s "ax
nnoremap x x

" del line
nnoremap d "0dd

" del in line forward
nnoremap <c-d> D

" del word back
"nnoremap <c-w> hvbd

" del word forward
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"adw'
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"ade'

" del cr ( line join )
nnoremap <c-m> J

" select
nnoremap I v

" select word
nnoremap i :call Slct_word()<cr>

" select char current - word end
"nnoremap xx ve

" select box
nnoremap v <c-v>

" select all
"nnoremap A ggVG

" select re
"nnoremap xx gv

" yank line
nnoremap c :call N_cpy()<cr>

" pc clipboard line
"nnoremap C "+yy

" yank char
"nnoremap xx "0yl

" yank clear
nnoremap <c-c> :call Rgstr__clr()<cr>

" paste
nnoremap p "0P

" paste pc clipboard
"nnoremap xx "+P

" mv line up
"nnoremap xx "0ddk"0P

" dpl line
"nnoremap <c-d> "0yy"0P

" undo, redo
nnoremap h     u
nnoremap <c-h> <c-r>

" repeat
"nnoremap . .

" repeat memory
nnoremap <c-^> qy
nnoremap ^     @y

" num inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap " <<
nnoremap # >>

" char toggle ( upper / lower )
nnoremap u :call Char_tgl()<cr>

" char toggle ( turn )
nnoremap U :call N_char_tgl_trn()<cr>

" upper / lower
"nnoremap xx v~

" 
" srch
" 

" srch char in line - forward
"nnoremap xx f

" srch char in line repeat
nnoremap ; ;

" srch
nnoremap n     :call N_srch("f")<cr>
nnoremap <c-n> :call N_srch("b")<cr>

" srch word set
nnoremap e :call N_srch_str__(v:false)<cr>

" srch word set ( word 1 )
nnoremap E :call N_srch_str__(v:true)<cr>

" srch cmdline
nnoremap <leader>k /

" srch history
nnoremap <leader>n :SrchHstry<cr>

" srch word set prv ( tgl )
nnoremap N /<c-p><c-p><cr>

" srch init ( hl )
nnoremap S /<cr>N

" srch replace all > yank ( file )
nnoremap :s :%s//<c-r>0/gc

" srch replace one > yank next ( only srch )
nnoremap <c-p> gn

" tag jump tab new
nnoremap t :call N_tag_jmp()<cr>

" mark
"nnoremap xx m

" wrap tgl
nnoremap :w :set wrap!

" grep ( rg fzf )
nnoremap <leader>o :Rg <cr>

" grep ( rg qf )
nnoremap :g :call Grep("")<cr>
nnoremap :G :call Grep("-w")<cr>

" grep bfr ( blines )
nnoremap <leader>i :BLines<cr>

" 
" cmd
" 

" cmd history
nnoremap <leader>l :CmdHstry<cr>

" ins sys cmd ( read )
nnoremap :r :r! 

" ins sys ls ( read )
nnoremap :l :Lf 

"
" tab
"

" tab mv
nnoremap <tab>   gt
nnoremap <s-tab> gT

" tab order
nnoremap <s-left>  :tabm-1<cr>
nnoremap <s-right> :tabm+1<cr>
"nnoremap < :tabm-1<cr>
"nnoremap > :tabm+1<cr>

" buffer list
"nnoremap :b :buffers

" inf char
nnoremap ga ga


" numpad shift
nnoremap <kInsert>   0
nnoremap <kEnd>      1
nnoremap <kDown>     2
nnoremap <kPageDown> 3
nnoremap <kLeft>     4
nnoremap <kOrigin>   5
nnoremap <kRight>    6
nnoremap <kHome>     7
nnoremap <kUp>       8
nnoremap <kPageUp>   9

"
" esc
"
nnoremap <esc>   <esc>
"nnoremap <space> <esc>
"nnoremap <cr>    <esc>
nnoremap <bs>    <esc>

nnoremap = <esc>
nnoremap @ <esc>
"nnoremap ; <esc>
"nnoremap , <esc>
nnoremap . <esc>
"nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>
"nnoremap ^ <esc>
nnoremap / <esc>
nnoremap ? <esc>

"nnoremap ! <esc>
"nnoremap " <esc>
"nnoremap # <esc>
"nnoremap $ <esc>
nnoremap ( <esc>
"nnoremap < <esc>
nnoremap > <esc>

nnoremap <c-space> <esc>
nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non ?
"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-/> <esc> " non ?
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

nnoremap 0 <esc>
"nnoremap a <esc>
"nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
"nnoremap g <esc>
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
"nnoremap y <esc>
nnoremap z <esc>

nnoremap A <esc>
nnoremap B <esc>
nnoremap C <esc>
nnoremap D <esc>
"nnoremap E <esc>
nnoremap F <esc>
nnoremap G <esc>
nnoremap H <esc>
"nnoremap I <esc>
"nnoremap J  <esc>
"nnoremap K  <esc>
"nnoremap L <esc>
nnoremap M <esc>
"nnoremap N <esc>
nnoremap O <esc>
nnoremap Q <esc>
nnoremap P <esc>
nnoremap R <esc>
"nnoremap S <esc>
nnoremap T <esc>
"nnoremap U <esc>
"nnoremap W <esc>
nnoremap V <esc>
nnoremap Y <esc>

"nnoremap <c-a> <esc>
"nnoremap <c-b> <esc>
"nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
nnoremap <c-f> <esc>
nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
"nnoremap <c-p> <esc>
"nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
"nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"nnoremap <c-w> <esc>
nnoremap <c-x> <esc>
"nnoremap <c-y> <esc>
nnoremap <c-z> <esc>

"nnoremap ga <esc>
"nnoremap gg <esc>
"nnoremap gh <esc>
nnoremap gi <esc>
"nnoremap gj <esc>
"nnoremap gk <esc>
nnoremap gl <esc>
"nnoremap gm <esc>
"nnoremap go <esc>
nnoremap gt <esc>
"nnoremap gu <esc>
nnoremap gv <esc>

"
" mode visual
"

" mode ch line
vnoremap i V

" mode ch box
vnoremap v <c-v>

" 
" cursor mv
" 

" cursor mv char forward
vnoremap l l

" cursor mv char back
vnoremap <c-s> h
vnoremap <c-o> h

" cursor mv word - forward
vnoremap f e

" cursor mv word - back
"vnoremap xx b
"vnoremap xx bh
"vnoremap xx Bh

" cursor mv selected word reduce dlm _ l
vnoremap _ of_lo
"vnoremap <c-_> of_lo

" cursor mv selected word reduce dlm _ r
vnoremap <c-_> F_h
"vnoremap _ F_h

" cursor mv space - forward ( word pre )
"vnoremap xx wh

" cursor mv selected edge
vnoremap y o

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv bracket pair
vnoremap <c-l> %

" cursor mv file edge back    ( file begin )
vnoremap gk gg0

" cursor mv file edge forward ( file end   )
vnoremap gj G$l

" ins | cut & ins
vnoremap <expr> <space> mode() == "<c-v>" ? "I" : "c"
" cut & ins
vnoremap <leader><space> "ac

" ins $ | cursor mv in line end
vnoremap <expr> <c-y> mode() == "<c-v>" ? "$A" : "g_"

" ins comment 1
vnoremap ! :call V_cmnt_1()<cr>

" ins comment mlt
vnoremap $ :call V_cmnt_mlt()<cr>

" ins selected edge
vnoremap ; :<c-u>InsSlctdEdge 
"vnoremap b :<c-u>InsSlctdEdge 

" del str > yank
vnoremap d "0d

" del str > yank not
vnoremap s "ax
vnoremap x "ax

" del cr
vnoremap <c-m> J

" del line end space
vnoremap Y :call V_line_end_space_del()<cr>
vnoremap S :call V_line_end_space_del()<cr>

" mv str back
vnoremap <c-w> :call V_mv_str("h")<cr>

" mv str forward
vnoremap <c-e> :call V_mv_str("l")<cr>

" mv line
vnoremap J :call V_mv_line("j")<cr>
vnoremap K :call V_mv_line("k")<cr>

" select all
vnoremap a <esc>ggVG

" yank selected
vnoremap o :call V_cpy()<cr>
vnoremap c :call V_cpy()<cr>
"vnoremap c "0y

" pc clipboard selected
"vnoremap C "+y

" paste
vnoremap <expr> p mode() == "<c-v>" ? "I<c-r>0<esc>" : '"ad"0P'

" paste visual box
"vnoremap P I<c-r>0<esc>

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" num seq
vnoremap A g<c-a>

" indent
vnoremap " <gv
vnoremap # >gv

" indent tab > space
vnoremap :t :!expand -t 4

" upper / lower tgl
vnoremap u     ~viw

" upper all
vnoremap U     Uviw

" lower all
vnoremap <c-u> uviw

"
" srch
"

" srch forward
"vnoremap xx xx

" srch back
vnoremap <c-n> :call V_srch_slct("f")<cr>

" srch word set
vnoremap n :call V_srch_str__slctd_str(v:false)<cr>
vnoremap e :call V_srch_str__slctd_str(v:false)<cr>

" srch word set ( word 1 )
vnoremap E :call V_srch_str__slctd_str(v:true)<cr>

" srch cmdline
vnoremap <leader>k "ay/<c-r>a

" srch replace all > yank
vnoremap :s :s//<c-r>0/gc<cr>

" srch replace one > yank, nxt
vnoremap <c-p> "ad"0Plgn

" tag jmp
vnoremap t :call V_tag_jmp()<cr>

" grep bfr ( blines )
vnoremap <leader>i :call V_blines()<cr>

" grep ( rg )
vnoremap <leader>o "ay:Rg <c-r>a<cr>

" grep func define
"vnoremap <leader>xx "ay:Rg <c-r>a<cr>func

"
" nop
"
"vnoremap <space> <nop>

"
" esc
"
vnoremap @ <esc>
vnoremap * <esc>
vnoremap / <esc>
"vnoremap ! <esc>
"vnoremap " <esc>
"vnoremap # <esc>
"vnoremap $ <esc>
"vnoremap _ <esc>
vnoremap ? <esc>
vnoremap ( <esc>
"vnoremap ; <esc>
vnoremap < <esc>
vnoremap > <esc>
vnoremap = <esc>
vnoremap , <esc>
vnoremap . <esc>

"vnoremap a <esc>
vnoremap b <esc>
"vnoremap c <esc>
"vnoremap d <esc>
"vnoremap e <esc>
"vnoremap f <esc>
vnoremap h <esc>
"vnoremap i <esc>
vnoremap m <esc>
"vnoremap n <esc>
"vnoremap o <esc>
"vnoremap p <esc>
vnoremap q <esc>
vnoremap r <esc>
"vnoremap s <esc>
"vnoremap t <esc>
"vnoremap u <esc>
"vnoremap v <esc>
vnoremap w <esc>
"vnoremap x <esc>
"vnoremap y <esc>

"vnoremap A <esc>
vnoremap B <esc>
vnoremap C <esc>
vnoremap F <esc>
vnoremap H <esc>
vnoremap I <esc>
"vnoremap J <esc>
"vnoremap K <esc>
"vnoremap L <esc>
vnoremap M <esc>
vnoremap N <esc>
vnoremap O <esc>
"vnoremap P <esc>
vnoremap R <esc>
"vnoremap S <esc>
"vnoremap U <esc>
vnoremap V <esc>
"vnoremap Y <esc>

"vnoremap <c-_> <esc>

vnoremap <c-a> <esc>
"vnoremap <c-b> <esc>
"vnoremap <c-c> <esc>
vnoremap <c-d> <esc>
"vnoremap <c-e> <esc>
vnoremap <c-f> <esc>
vnoremap <c-h> <esc>
vnoremap <c-i> <esc>
"vnoremap <c-l> <esc>
"vnoremap <c-m> <esc>
"vnoremap <c-n> <esc>
"vnoremap <c-o> <esc>
"vnoremap <c-p> <esc>
vnoremap <c-q> <esc>
vnoremap <c-r> <esc>
"vnoremap <c-s> <esc>
"vnoremap <c-u> <esc>
vnoremap <c-v> <esc>
"vnoremap <c-w> <esc>
vnoremap <c-x> <esc>
"vnoremap <c-y> <esc>

vnoremap gg <esc>
vnoremap gj <esc>
vnoremap gk <esc>
vnoremap go <esc>

"
" mode insert
"

" quit, esc
inoremap <expr> <esc>
\ pumvisible()            ? "<c-e>"  :
\ Is_cursor_line_start0() ? "<esc>"  :
\                           "<esc>l"

" cursor mv line in
inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$
"inoremap <c-a> <c-o>^

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <c-f> <c-o>l
inoremap <expr> <c-o> pumvisible() ? "<c-y>" : "<c-o>h"
inoremap <c-s> <c-o>h

" cursor mv word forward
"inoremap <c-f> <c-o>e<c-o>l

" cursor mv word back
"inoremap <c-q> <c-o>b

" cursor mv d
inoremap <c-n> <down>
"inoremap <expr> <c-n> pumvisible() ? "<down>" : "<down>"

" cursor mv u
inoremap <c-p> <up>
"inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<up>"

" del line
" non

" del char forward
inoremap <c-d> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <expr> <c-k>
\ pumvisible()         ? "<c-p>"   :
\ col(".") != col("$") ? "<c-o>dw" :
\                        ""

" del word back
inoremap <c-w> <c-w>

" ins cr
inoremap <c-m> <cr>

" ins tab
inoremap <tab> <c-v><tab>

" paste
"inoremap <c-v> <c-r>0

" paste pc clipboard
inoremap <c-v> <c-r>+

" input complete
inoremap <expr> <c-y> pumvisible() ? "<c-e>" : "<c-n>"

"   clear
"inoremap <expr> <esc> pumvisible() ? "<c-e>"  : ""
"inoremap <expr> <c-w> pumvisible() ? "<c-e>"  : "<c-w>"

" ins bracket
inoremap ( ()<c-o>h
inoremap < <><c-o>h
inoremap " ""<c-o>h
"inoremap { {}<c-o>h
"inoremap [ []<c-o>h
"inoremap ' ''<c-o>h

" numpad shift
inoremap <kInsert>   0
inoremap <kEnd>      1
inoremap <kDown>     2
inoremap <kPageDown> 3
inoremap <kLeft>     4
inoremap <kOrigin>   5
inoremap <kRight>    6
inoremap <kHome>     7
inoremap <kUp>       8
inoremap <kPageUp>   9

" ins symbol
func! I_symbol() abort

  let l:lst = ['/', '?', '%', '&', '$', '@']
  "let l:lst = ['!', '#', '$', '%', '&', '^', '~', '|', '?']

  call complete(col('.'), l:lst)
  return ''
endfunc
inoremap <c-u> <c-r>=I_symbol()<cr>
inoremap <c-_> <c-r>=I_symbol()<cr>

" ins bracket
func! I_bracket() abort
  call complete(col('.'), ['()', '{}', '[]', '""', "''"]) " [, '<>', '``']
  return ''
endfunc
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-r>=I_bracket()<cr>"

" ins num
func! I_num() abort
  call complete(col('.'), ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
  return ''
endfunc
"inoremap <c-n> <c-r>=I_num()<cr>

" ins register
func! I_reg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc
inoremap <c-r> <c-r>=I_reg()<cr>

" ins lua reserved word
func! I_lua_reserved() abort
  call complete(col('.'), [
  \   'end',
  \   'local',
  \   'return',
  \   'if elseif else end',
  \   'for key, val in pairs() do end',
  \   'function'
  \ ])
  return ''
endfunc
"inoremap <c-r> <c-r>=I_lua_reserved()<cr>

" ins ooq ( lua )
func! I_usual() abort
  call complete(col('.'), [
  \   '_s:',
  \   '_s._',
  \   'log._("", )',
  \   'log.pp("", )',
  \   '-- dbg',
  \   '--',
  \   '_.f',
  \   '_.t'
  \ ])
  return ''
"  \   'function',
"  \   'local',
"  \   'return',
"  \   'if _.t then return end',
"  \   'if  then',
"  \   'elseif  then',
"  \   'else',
"  \   'then',
"  \   'then return end',
"  \   'for key, val in pairs() do end',
"  \   'not',
"  \   'or',
"  \   'and',
"  \   'end',
"  \   'nil',
"  \   'alias',
endfunc
"inoremap <c-u> <c-r>=I_usual()<cr>

"
" nop
"
"inoremap <c-_> <nop>
"inoremap <c-:> <nop>

inoremap <c-b> <nop>
"inoremap <c-p> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>


" 
" mode cmd
" 

" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>
"cnoremap <c-a> <home>
"cnoremap <c-e> <end>

" cursor mv char
cnoremap <c-s> <Left>
"cnoremap <c-b> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <S-Left>
cnoremap <c-f> <S-Right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word forward
"cnoremap ?? non ? idea <S-Right><c-w>
cnoremap <c-k> <del>

" del word back
cnoremap <c-w> <c-w>

" del in line back
cnoremap <c-u> <c-u>

" paste
cnoremap <c-v> <c-r>0

" history
"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

" numpad shift
cnoremap <kInsert>   0
cnoremap <kEnd>      1
cnoremap <kDown>     2
cnoremap <kPageDown> 3
cnoremap <kLeft>     4
cnoremap <kOrigin>   5
cnoremap <kRight>    6
cnoremap <kHome>     7
cnoremap <kUp>       8
cnoremap <kPageUp>   9

" 
" leader esc
" 

"nnoremap <leader>f <esc>
"nnoremap <leader>h <esc>
"nnoremap <leader>r <esc>
"nnoremap <leader>y <esc>

vnoremap <leader>u <esc>
"vnoremap <leader>y <esc>


" 
" etc
" 

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  exe "set <xUp>=\e[1;*A"
  exe "set <xDown>=\e[1;*B"
  exe "set <xRight>=\e[1;*C"
  exe "set <xLeft>=\e[1;*D"
end

" 
" grep ( rg )
" 
func! Grep(opt) abort
  
  let l:str = @/
  let l:str = substitute(l:str, "(", '\\(', "")

  exe 'r! rg -n -s "'.l:str.'"'
  \           . ' -g "*.lua" -g "*.script" -g "*.gui_script"'
  \           . ' -g "*.txt" -g "*.json" -g "*.fish" -g "*.vim"'
  \           . ' ' . a:opt
endfunc

" cmd grep = rg
"if executable('rg')
"  let &grepprg = 'rg -n -s -g "*.lua"'
"  set grepformat=%f:%l:%m
"endif

"
" quickfix
"
autocmd QuickFixCmdPost grep,vimgrep tab cw


" 
" plugin  #bgn#
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'mattn/vim-molder'
Plug 'mattn/vim-molder-operations'
call plug#end()

"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {'ctrl-o': 'tab drop'}

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

" grep bfr ( blines )

func! V_blines() abort

  call V_srch_str__slctd_str(v:false)
  exe "BLines " . @a
endfunc

command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(<q-args>,{'options': ['--no-sort']}, <bang>1)

" files
nnoremap <leader>u :Files <cr>
"vnoremap <leader>u :Files <cr> " non
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" grep ( rg )

" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   "rg --color=always --line-number --smart-case --no-multiline --no-heading "
\     ."-- ".shellescape(escape(<q-args>, '(')),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

" file history
command! -bang -nargs=* FileHstry
\ call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" cmd history
command! -bang -nargs=* CmdHstry
\ call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" srch history
command! -bang -nargs=* SrchHstry
\ call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" ctags ( fzf )

set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap xx :!sh sh/ctags.sh

"nnoremap <leader>xx :Tags <c-r><c-w><cr>
"vnoremap <leader>xx "ay:Tags <c-r>a<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)


"
" vim-bookmarks
"
"highlight BookmarkSign           ctermbg=magenta ctermfg=magenta
"highlight BookmarkLine           ctermbg=magenta ctermfg=magenta
"highlight BookmarkAnnotationSign ctermbg=magenta ctermfg=magenta
"highlight BookmarkAnnotationLine ctermbg=magenta ctermfg=magenta

" mark
"nmap M <Plug>BookmarkToggle

" annotate
"nmap Mi <Plug>BookmarkAnnotate

" list
"nmap <leader>m <Plug>BookmarkShowAll

" prv, nxt
"nmap Mp <Plug>BookmarkPrev
"nmap Mn <Plug>BookmarkNext

" del in buffer
"nmap :mc :BookmarkClear

let g:bookmark_no_default_key_mappings = 1

"nmap <c-j>     <Plug>BookmarkMoveToLine
"nmap <leader>x <Plug>BookmarkClearAll

"
" molder
"

" launch
nnoremap <leader>d :tabnew<cr>:e .<cr>

" plugin  #end#


"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o


"
" vim script
"

func! N_cpy() abort

  exe 'normal! "0yy'
  exe 'normal! "+yy'
endfunc

func! V_cpy() abort

  exe 'normal! gv"0y'
  exe 'normal! gv"+y'
  
  "let l:str = V_slctd_str()
  "let @0 = l:str
  "let @+ = l:str
endfunc

func! Is_line_emp() abort
  
  if col('$') == 1
    return v:true
  else
    return v:false
  end
endfunc

func! N_ins_cr() abort
  
  exe "normal! i\<cr>"
  normal! ==^
endfunc

func! N_new_line() abort

  exe 'normal! O '
  exe 'normal! x'
endfunc

func! N_cursor_mv_line_start_or_new_line() abort

  if Is_cursor_line_start1()
    call N_new_line()
  else
    call N_cursor_mv_line_start1()
  end
endfunc

func! Is_cursor_line_start1() abort
  
  let l:pos_c = getpos('.')
  
  let l:col_c = col('.')
  
  call N_cursor_mv_line_start1()
  let l:col_s1 = col('.')
  
  call setpos('.', pos_c)
  
  if l:col_c == l:col_s1
    return v:true
  else
    return v:false
  end
endfunc

func! N_cursor_mv_line_start1() abort

  if Is_line_space()
    call N_cursor_mv_line_end()
  else
    normal! ^
  end
endfunc

func! Is_cursor_line_start0() abort
  
  if col('.') == 1
    return v:true
  else
    return v:false
  end
endfunc

func! N_cursor_mv_line_start0() abort
  
  if ! Is_line_emp()
    normal! 0
  end
endfunc

func! Is_line_space() abort
  
  let l:idx = match(getline('.'), '^\s*$')
  if l:idx == 0
    return v:true
  else
    return v:false
  end
endfunc

func! N_cursor_mv_line_end() abort

  if ! Is_line_emp()
    exe 'normal! $l'
  end
endfunc

func! N_cursor_mv_word_f() abort

  let l:c_char = Char()
  let l:l_char = Char_l()

  if l:c_char =~ ' ' && l:l_char =~ ' '
    normal! w
  else
    normal! el
  end
endfunc

func! N_cursor_mv_word_b() abort
  
  if Is_cursor_line_start0()
    normal! k
    call N_cursor_mv_line_end()
    
  elseif Is_line_space()
    call N_cursor_mv_line_start0()
    
  elseif Is_cursor_line_start1()
    call N_cursor_mv_line_start0()
  else
    normal! b
  end
endfunc

func! N_cursor_mv_word_b_pre() abort

  let l:c_char = Char()
  let l:l_char = Char_l()

  if l:c_char =~ ' ' && l:l_char !~ ' '
    exe "normal! gegel"
  else
    exe "normal! gel"
  end
endfunc

func! Rgstr__clr() abort

  let @0 = ''
endfunc

func! Slct_word() abort

  let l:c = Char()

  if     l:c =~ '\w'
    exe "normal! viw"

  elseif l:c =~ ' '
    exe "normal! vwh"

  else
    exe "normal! v"
  endif
endfunc

func! Rg_out_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  return l:ret
endfunc

func! Buf_nr() abort

  return bufnr("%")
endfunc

func! Tag_jmp(rg_out_line) abort
  
  if a:rg_out_line == ''
    return
  end

  let l:rg_out_line_ar = Rg_out_parse(a:rg_out_line)
  let l:filename = l:rg_out_line_ar[0]
  let l:line_num  = get(l:rg_out_line_ar, 1, 1)

  if ! filereadable(l:filename)
    return
  end

  exe "tab drop " . l:filename
  exe "normal! " . l:line_num . "G"
endfunc

func! N_tag_jmp() abort

  let l:base_buf_nr = Buf_nr()

  let l:line = getline('.')
  call Tag_jmp(l:line)

  exe "sbuffer " . l:base_buf_nr
  exe "normal! " . "j"
endfunc

func! V_tag_jmp() range abort

  let l:base_buf_nr = Buf_nr()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(line_num)
    call Tag_jmp(l:line)

    exe "sbuffer " . l:base_buf_nr
  endfor
endfunc

func! Char_c() abort " new

endfunc

func! Char() abort " old

  let l:c = getline('.')[col('.')-1]
  " getcursorcharpos() ?

  return l:c
endfunc

func! Char_l() abort

  let l:c = getline('.')[col('.')]
  return l:c
endfunc

func! Char_tgl() abort

  let l:c   = Char()
  let l:rpl = Char_tgl_char(l:c)

  if l:rpl == ""
    normal! v~
    return
  endif

  exe "normal! x"
  exe "normal! i".l:rpl
endfunc

func! N_char_tgl_trn() abort

  let l:c   = Char()
  let l:rpl = Char_tgl_trn(l:c)

  if l:rpl == ""
    normal! v~
    return
  endif

  exe "normal! x"
  exe "normal! i".l:rpl
endfunc

func! Char_tgl_char(c) abort

  let l:rpl = Char_tgl_bracket(a:c)
  if l:rpl != ""
    return l:rpl
  endif

  let l:rpl = Char_tgl_etc(a:c)
  if l:rpl != ""
    return l:rpl
  endif

  return l:rpl
endfunc

func! Char_tgl_bracket(c) abort

  let l:rpl = ""

  if     a:c == "("
    let l:rpl = "["
  elseif a:c == ")"
    let l:rpl = "]"

  elseif a:c == "["
    let l:rpl = "{"
  elseif a:c == "]"
    let l:rpl = "}"

  elseif a:c == "{"
    let l:rpl = "<"
  elseif a:c == "}"
    let l:rpl = ">"

  elseif a:c == "<"
    let l:rpl = "("
  elseif a:c == ">"
    let l:rpl = ")"
  endif

  return l:rpl
endfunc

func! Char_tgl_etc(c) abort

  let l:rpl = ""

  if     a:c == "/"
    let l:rpl = "-"
  elseif a:c == "-"
    let l:rpl = "\\"
  elseif a:c == "\\"
    let l:rpl = "|"
  elseif a:c == "|"
    let l:rpl = "/"

  elseif a:c == '"'
    let l:rpl = "'"
  elseif a:c == "'"
    let l:rpl = '"'

  elseif a:c == "*"
    let l:rpl = "+"
  elseif a:c == "+"
    let l:rpl = "*"

  elseif a:c == ","
    let l:rpl = "."
  elseif a:c == "."
    let l:rpl = ","

  elseif a:c == ";"
    let l:rpl = ":"
  elseif a:c == ":"
    let l:rpl = ";"

  "elseif a:c ==# "T"
  "  let l:rpl = "f"
  "elseif a:c ==# "F"
  "  let l:rpl = "t"

  "elseif a:c ==# "L"
  "  let l:rpl = "r"
  "elseif a:c ==# "R"
  "  let l:rpl = "l"

  "elseif a:c ==# "X"
  "  let l:rpl = "y"
  "elseif a:c ==# "Y"
  "  let l:rpl = "x"

  "elseif a:c ==# "I"
  "  let l:rpl = "o"
  "elseif a:c ==# "O"
  "  let l:rpl = "i"

  "elseif a:c == "<"
  "  let l:rpl = ">"
  "elseif a:c == ">"
  "  let l:rpl = "<"

  "elseif a:c == "{"
  "  let l:rpl = "}"
  "elseif a:c == "}"
  "  let l:rpl = "{"

  "elseif a:c == "["
  "  let l:rpl = "]"
  "elseif a:c == "]"
  "  let l:rpl = "["

  "elseif a:c == "("
  "  let l:rpl = ")"
  "elseif a:c == ")"
  "  let l:rpl = "("
  endif

  return l:rpl
endfunc

func! Char_tgl_trn(c) abort
  
  let l:rpl = ""

  if     a:c == "<"
    let l:rpl = ">"
  elseif a:c == ">"
    let l:rpl = "<"

  elseif a:c == "{"
    let l:rpl = "}"
  elseif a:c == "}"
    let l:rpl = "{"

  elseif a:c == "["
    let l:rpl = "]"
  elseif a:c == "]"
    let l:rpl = "["

  elseif a:c == "("
    let l:rpl = ")"
  elseif a:c == ")"
    let l:rpl = "("
  endif

  return l:rpl
endfunc

"func! N_bracket_pair_tgl() abort
"
"  let l:col1 = col(".")
"  call N_bracket_tgl()
"
"  exe "normal! %"
"  let l:col2 = col(".")
"
"  if l:col1 == l:col2
"    return
"  endif
"
"  call N_bracket_tgl()
"  exe "normal! %"
"endfunc

func! Char_tgl2() abort " use not
  
  let l:c = Char()

  if     l:c == "("
    let l:rpl = "["
  elseif l:c == ")"
    let l:rpl = "]"

  elseif l:c == "["
    let l:rpl = "{"
  elseif l:c == "]"
    let l:rpl = "}"

  elseif l:c == "{"
    let l:rpl = "<"
  elseif l:c == "}"
    let l:rpl = ">"

  elseif l:c == "<"
    let l:rpl = "("
  elseif l:c == ">"
    let l:rpl = ")"
  else
    "normal! v~
    return
  endif

  exe "normal! x"
  exe "normal! i".l:rpl
endfunc

func! Cursor_word() abort

  let l:word = expand("<cword>>")
  return l:word
endfunc

func! V_mv_str(lr) abort

  exe 'normal! gv"ax' . a:lr . '"aP'

  exe "normal! v"
  let l:mv_len = strchars(@a) - 1
  if l:mv_len <= 0
    return
  endif
  exe "normal! " . l:mv_len . "h"
endfunc

func! V_mv_line(ud) range abort

  let l:mv_num   = a:lastline - a:firstline
  let l:line_num = l:mv_num + 1

  exe 'normal! ' . a:firstline . 'G'
  exe 'normal! ' . l:line_num . '"add'
  exe 'normal! ' . a:ud
  exe 'normal! "aP'
  exe 'normal! V'

  if l:mv_num >= 1
    exe 'normal! ' . l:mv_num . 'j'
  endif
endfunc

func! V_slctd_str() abort

  exe 'normal! gv"ay'
  return @a
endfunc

func! V_slctd_str_len() abort

  "let l:slctd_str = V_slctd_str()
  let l:len = strchars(V_slctd_str())
  return l:len
endfunc

command! -nargs=? InsSlctdEdge call V_ins_slctd_edge(<q-args>)
func! V_ins_slctd_edge(c) abort
  
  if     a:c   == "("
    let  l:c_l =  "("
    let  l:c_r =  ")"
  elseif a:c   == "["
    let  l:c_l =  "["
    let  l:c_r =  "]"
  elseif a:c   == "{"
    let  l:c_l =  "{"
    let  l:c_r =  "}"
  elseif a:c   == "<"
    let  l:c_l =  "<"
    let  l:c_r =  ">"
  else
    let  l:c_l = a:c
    let  l:c_r = a:c
  endif
  
  call V_ins_slctd_r(l:c_r)
  call V_ins_slctd_l(l:c_l)
endfunc

func! V_ins_slctd_l(c) abort

  exe 'normal! `<'
  exe 'normal! i' . a:c
endfunc

func! V_ins_slctd_r(c) abort

  exe 'normal! `>l'
  exe 'normal! i' . a:c
endfunc

func! N_srch_str__(word1) abort

  let @/ = Cursor_word()

  if a:word1
    let @/ = '\<' . @/ . '\>'
  endif
endfunc

func! V_srch_str__slctd_str(word1) abort

  let @/ = V_slctd_str()

  if a:word1
    let @/ = '\<' . @/ . '\>'
  endif
endfunc

func! V_is_slctd_eq_srch_str() abort

  if V_slctd_str() == @/
    return v:true
  else
    return v:false
  endif
endfunc

func! N_srch(dir) abort

  if     a:dir == "f"
    normal! n

  elseif a:dir == "b"
    normal! N
  endif
endfunc

func! V_srch(dir) abort " use not

  if !V_is_slctd_eq_srch_str()
    call V_srch_str__slctd_str(v:false)
  endif
endfunc

func! N_srch_slct(dir) abort " use not

  if     a:dir == "f"
    normal! gn

  elseif a:dir == "b"
    normal! gN
  endif
endfunc

func! V_srch_slct(dir) abort

  if     a:dir == "f"
    exe 'normal! `>lgn'

  elseif a:dir == "b"
    exe 'normal! `<hgN'
  endif
endfunc

func! Cmnt_1(head) abort

  let l:str_df = {
  \ "lua" : '-- '      ,
  \ "text": '# '       ,
  \ "vim" : '"'        ,
  \ "fish": '#'        ,
  \ "sh"  : '#'        ,
  \ "javascript": '// '
  \ }
  let l:dflt = '# '
  let l:str = get(l:str_df, &filetype, l:dflt)

  exe 'normal! ' . a:head . 'i' . l:str
  exe 'normal! 0'
endfunc

func! N_cmnt_1() abort
  call Cmnt_1("^")
endfunc

func! V_cmnt_1() range abort

  for line_num in range(a:firstline, a:lastline)
    exe 'normal! ' . line_num . 'G'
    call Cmnt_1("0")
  endfor
endfunc

func! Cmnt_mlt(pos) abort

  let l:str_df = #{
  \  lua       : ['--[[' , '--]]'],
  \  html      : ['<!--' ,  '-->'],
  \  css       : ['/*'   ,  ' */'],
  \  javascript: ['/*'   ,  ' */'],
  \  dflt      : ['/*'   ,  ' */']
  \ }

  if has_key(l:str_df, &filetype)
    let l:filetype = &filetype
  else
    let l:filetype = "dflt"
  endif
  let l:str = l:str_df[l:filetype]

  if     a:pos == "bgn"
    exe 'normal! O'
    exe 'normal! i' . l:str[0]

  elseif a:pos == "end"
    exe 'normal! o'
    exe 'normal! i' . l:str[1]
  endif
endfunc

func! N_cmnt_mlt() abort
  call Cmnt_mlt("bgn")
  call Cmnt_mlt("end")
endfunc

func! V_cmnt_mlt() range abort

  exe 'normal! ' . a:lastline  . 'G'
  call Cmnt_mlt("end")

  exe 'normal! ' . a:firstline . 'G'
  call Cmnt_mlt("bgn")
endfunc

func! V_line_end_space_del() abort
  exe 's/[ \t]*$//g'
endfunc

func! V_line_padding() range abort
  
  let l:char = " "
  let l:w    = 75

  for line_num in range(a:firstline, a:lastline)
    
    exe 'normal! ' . line_num . 'G'
    
    "let l:col = charidx(getline(line_num), col('$'))
    let l:col = col('$')
    let l:len = l:w - l:col
    
    exe 'normal! ' . l:len . 'A' . l:char
  endfor
endfunc

command! -nargs=? -complete=dir Lf call Lf(<q-args>)
func! Lf(dir) abort

  let l:exe = 'r! lf ' . trim(a:dir)
  "let l:exe = 'r! ls -dFA ' . trim(a:dir) . '**.*'
  "echo l:exe
  exe l:exe
endfunc

func! Hl_grp() abort

  echo synIDattr(synID(line("."), col("."), 1), "name")
endfunc
" and
" :highlight [grp name]

" 
" defold err cnv
" 
func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" file rcnt qf " use not
command! -nargs=0 FileRcntQf
\ call setqflist([], ' ', {'lines' : v:oldfiles, 'efm' : '%f',
\                          'quickfixtextfunc' : 'Qf_old_files'}) | tab cw

func! Qf_old_files(info)

  " info frm quickfix
  let items = getqflist({'id' : a:info.id, 'items' : 1}).items
  let l = []
  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    " mod file-name simple
    call add(l, fnamemodify(bufname(items[idx].bufnr), ':p:.'))
  endfor
  return l
endfunc

