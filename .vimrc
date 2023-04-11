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

hi CursorLineNr ctermfg=magenta

hi Visual                         ctermbg=magenta  cterm=none
hi VisualNOS                      ctermbg=magenta  cterm=none
hi Search      ctermfg=yellow     ctermbg=cyan     cterm=none
hi IncSearch   ctermfg=yellow     ctermbg=cyan     cterm=none
hi MatchParen  ctermfg=magenta    ctermbg=none

hi TabLineSel                     ctermbg=magenta  cterm=none
hi TabLine     ctermfg=lightblue  ctermbg=33       cterm=none
hi TabLineFill                    ctermbg=33       cterm=none

hi StatusLine  ctermfg=lightblue  ctermbg=33       cterm=none
hi EndOfBuffer ctermfg=cyan                        cterm=none

hi Pmenu       ctermfg=lightgreen ctermbg=blue
hi PmenuSel    ctermfg=cyan       ctermbg=magenta  cterm=bold

hi ErrorMsg    ctermfg=magenta    ctermbg=none     cterm=none
hi WarningMsg  ctermfg=magenta    ctermbg=none     cterm=none

hi NonText     ctermfg=25         ctermbg=none     cterm=none
hi SpecialKey  ctermfg=25         ctermbg=none     cterm=none

hi Comment     ctermfg=14         ctermbg=none     cterm=none

hi FullWidthSpace ctermbg=white
match FullWidthSpace /　/

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

" file opn, cursor mv last
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" | endif
augroup END

autocmd BufWinEnter * normal! zz
"autocmd BufWinEnter * normal! zt

set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " cursor mv cr
set virtualedit+=block  " box slct
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
nnoremap :q :q!

" quit other
"nnoremap W :tabo<cr>

" background job
nnoremap <c-z> <c-z>

" save
"nnoremap a :w<cr>
nnoremap a :call Save()<cr>

" reload
"nnoremap xx :e!

" opn tab new
"nnoremap xx :tabnew filename

" opn latest
"nnoremap xx `0

" opn file rcnt ( history )
nnoremap <leader>p :FileHstry<cr>

" file srch ( fzf )
nnoremap <leader>l :Files <cr>

" 
" opn
" 

" opn tab file
nnoremap :e :Opn 

" opn .vimrc
nnoremap gh :call Opn_vimrc()<cr>

" opn app slf
nnoremap go :call Opn_app_slf()<cr>

" opn app
nnoremap gp :call Opn_app_by_path()<cr>

" opn tmp
nnoremap gt :call Opn_tmp()<cr>

" opn vim key note
nnoremap gv :call Opn_vim_key()<cr>

" opn memo
nnoremap gm :call Opn_memo()<cr>

" opn grep work
"nnoremap xx :call Opn_grep_work()<cr>

" opn brwsr
"nnoremap gb <plug>(openbrowser-smart-search)

" opn markdown preview
"nnoremap xx :call Markdown_2_html()<cr>

" markdown __ ins itm
nnoremap Y :call Ins__markdown_itm()<cr>

" markdown __ tgl chk
nnoremap x :call Char__tgl_markdown_chk()<cr>

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
nnoremap y :call N_cursor__mv_line_top_or_new_line()<cr>

" cursor mv in line start
nnoremap <c-a> 0

" cursor mv in line end
nnoremap <c-y> :call N_cursor__mv_line_end()<cr>
nnoremap <c-e> :call N_cursor__mv_line_end()<cr>
"nnoremap Y     $

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-s> h
nnoremap <c-o> h

" cursor mv word - forward
nnoremap f :call N_cursor__mv_word_f()<cr>

" cursor mv word - back
nnoremap o :call N_cursor__mv_word_b()<cr>

" cursor mv word - back pre
"nnoremap xx :call N_cursor__mv_word_b_pre()<cr>

" cursor mv word dlm _ forward
nnoremap _ f_l
"nnoremap <c-_> f_l

" cursor mv word dlm _ back
nnoremap <c-_> hT_
"nnoremap _ hT_

" cursor mv bracket pair
nnoremap <c-l> %

" cursor mv bracket out back
nnoremap L [{

" cursor mv bracket fnc back
"nnoremap xx [m

" cursor mv edited ( jmp list )
nnoremap q     <c-o>
nnoremap <c-q> <c-i>

" cursor mv file back    ( file begin )
nnoremap gk gg0

" cursor mv file forward ( file end   )
nnoremap gj G$l

" cursor mv edit latest
nnoremap M `.

" scroll
nnoremap K      <c-y>
nnoremap J      <c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" scroll cursor line upper
"nnoremap R zt
"nnoremap <leader>r zt

" scroll cursor line middle
"nnoremap F zz
"nnoremap <leader>f zz

" cursor mv window nxt
"nnoremap xx <c-w>w

" 
" slct / ynk / paste
" 

" slct
nnoremap I v

" slct word
nnoremap i :call Slct_word()<cr>

" slct char current - word end
"nnoremap xx ve

" slct box
nnoremap v <c-v>

" slct all
"nnoremap A ggVG

" slct re
"nnoremap xx gv

" ynk line
nnoremap c :call N_ynk()<cr>

" clipboard line
"nnoremap xx "+yy

" ynk char
"nnoremap xx "0yl

" ynk clear
nnoremap <c-c> :call Rgstr__clr()<cr>

" paste
nnoremap p "0P

" paste clipboard
"nnoremap xx "+P

" paste rgstr history ( fzf )
nnoremap <leader>y :RgstrHstry<cr>
"nnoremap <leader>y :call Rgstr_fzf()<cr>
"nnoremap <leader>r :call Rgstr_fzf()<cr>

" 
" undo, redo
" 
nnoremap h     u
nnoremap <c-h> <c-r>

" repeat
"nnoremap xx .

" 
" edit
" 

" ynk set clipboard
nnoremap C :call Ynk__clipboard()<cr>

" mode ins
nnoremap <space> i

" ins line
" ref nnoremap y

" ins cr
nnoremap m :call N_ins_cr()<cr>

" ins comment 1
nnoremap ! :call N_cmnt_1()<cr>

" ins comment mlt
nnoremap $ :call N_cmnt_mlt()<cr>

" ins comma
nnoremap , i, <esc>l

" ins comma $, nxt line
nnoremap < A,<esc>j

" ins period
nnoremap . i.<esc>l

" ins space
"nnoremap xx i <esc>

" ins date time
nnoremap * i<c-r>=strftime("%Y-%m-%d.%H:%M")<cr><esc>

" ins time
nnoremap T i<c-r>=strftime("%Y-%m-%d.%H:%M")<cr><esc>

" ins slf path
nnoremap gs :call N_ins_line_slf_path()<cr>

" del char
nnoremap s "ax
"nnoremap x x

" del line
nnoremap d :call N_line__del()<cr>

" del in line forward
nnoremap <c-d> D

" del word back
"nnoremap <c-w> hvbd

" del word forward
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"adw'
"nnoremap <expr> xx col(".") == col("$") ? "<esc>" : '"ade'

" del cr ( line join )
nnoremap <c-m> J

" mv line up
"nnoremap xx "0ddk"0P

" dpl line
nnoremap D "ayy"aP

" repeat memory
nnoremap <c-^> qy
nnoremap ^     @y

" num inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent shift
nnoremap # :call Indnt__shft_r()<cr>
nnoremap " :call Indnt__shft_l()<cr>

" indent correct
nnoremap ; :call Indnt__crct()<cr>
"nnoremap ; ==^

" char toggle ( upper / lower )
nnoremap u :call N_char__tgl()<cr>

" char toggle ( turn ) " use not
"nnoremap xx :call N_char__tgl2()<cr>

" upper / lower
"nnoremap xx v~

" 
" srch
" 

" srch char in line - forward
"nnoremap xx f

" srch char in line repeat
"nnoremap xx ;

" srch
nnoremap n     :call N_srch("f")<cr>
nnoremap <c-n> :call N_srch("b")<cr>

" srch str set
nnoremap e :call N_srch_str__(v:false)<cr>

" srch str set ( word 1 )
nnoremap E :call N_srch_str__(v:true)<cr>

" srch cmdline
nnoremap <leader>i /
nnoremap <c-f>     /

" srch str history ( fzf )
nnoremap <leader>n :SrchHstry<cr>

" srch str set prv ( tgl )
nnoremap N :call N_srch_str__prv()<cr>
"nnoremap N /<c-p><c-p><cr>

" srch hl init
nnoremap S /<cr>N

"normal! /dmydmydmy
"normal! /
"normal! N

" srch replace all > ynk ( file )
nnoremap :s :%s//<c-r>0/gc

" srch replace one > ynk nxt ( only srch )
nnoremap <c-p> gn

" srch ?=ts
nnoremap R /?ts=<cr>

" 
" grep
" 

" grep ( fzf )
nnoremap <leader>o :Rg <cr>

" grep bfr ( fzf )
nnoremap <leader>k :call N_grep_bfr()<cr>
"nnoremap <leader>k :BLines<cr>

" grep [rg]   ( read )
nnoremap :g :GrepStr 
nnoremap :G :GrepWrd 

" tag jmp tab new
nnoremap t :call N_tag_jmp()<cr>

" 
" mark
" 

" mark lst ( fzf )
nnoremap <leader>m :Mark<cr>
nnoremap rl        :Mark<cr>

" mark show tgl
nnoremap rf :call Mark_show_tgl()<cr>

" mark add / del tgl
nnoremap ro :call Mark_tgl()<cr>

" mark del all
nnoremap rd :call Mark_del_all()<cr>

" mark, cursor mv mark forward
nnoremap rj ]`

" mark, cursor mv mark back
nnoremap rk [`

" 
" cmd
" 

" cmd history ( fzf )
nnoremap <leader>j :CmdHstry<cr>

" ins sys cmd ( read )
nnoremap :r :r! 

" ins sys ls  ( read )
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

" 
" etc
" 

" buffer list
"nnoremap :b :buffers

" inf char
nnoremap gi ga

" wrap tgl
nnoremap :w :set wrap!

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
"nnoremap . <esc>
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
"nnoremap % <esc> " ?
nnoremap ( <esc>
"nnoremap < <esc>
nnoremap > <esc>

nnoremap <c-space> <esc>
nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non ?
"nnoremap <c-*> <esc> " non ?
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
nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
"nnoremap f <esc>
"nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap o <esc>
"nnoremap q <esc>
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
"nnoremap C <esc>
"nnoremap D <esc>
"nnoremap E <esc>
nnoremap F <esc>
nnoremap G <esc>
nnoremap H <esc>
"nnoremap I <esc>
"nnoremap J  <esc>
"nnoremap K  <esc>
"nnoremap L <esc>
"nnoremap M <esc>
"nnoremap N <esc>
nnoremap O <esc>
nnoremap Q <esc>
nnoremap P <esc>
"nnoremap R <esc>
"nnoremap S <esc>
"nnoremap T <esc>
nnoremap U <esc>
nnoremap W <esc>
nnoremap V <esc>
nnoremap X <esc>
"nnoremap Y <esc>

"nnoremap <c-a> <esc>
nnoremap <c-b> <esc>
"nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
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

nnoremap ga <esc>
nnoremap gb <esc>
nnoremap gg <esc>
"nnoremap gh <esc>
"nnoremap gi <esc>
"nnoremap gj <esc>
"nnoremap gk <esc>
nnoremap gl <esc>
"nnoremap gm <esc>
nnoremap gn <esc>
"nnoremap go <esc>
"nnoremap gp <esc>
"nnoremap gs <esc>
"nnoremap gt <esc>
"nnoremap gu <esc>
"nnoremap gv <esc>

"
" mode visual
"

" mode ch line
vnoremap i V

" mode ch box
vnoremap v <c-v>

" file srch ( fzf )
"vnoremap xx :Files <cr> " non

" opn brwsr
"vnoremap gb <plug>(openbrowser-smart-search)

" opn app
vnoremap go :call V_opn_app()<cr>

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

" cursor mv bracket out back
vnoremap L [{

" cursor mv bracket fnc back
"vnoremap xx [m

" cursor mv file edge back    ( file begin )
vnoremap gk gg0

" cursor mv file edge forward ( file end   )
vnoremap gj G$l

" 
" slct / ynk / paste
" 

" slct expnd
vnoremap I :call Slct_expnd()<cr>

" slct expnd r
vnoremap F :call Slct_expnd_r()<cr>
vnoremap O :call Slct_expnd_r()<cr>

" slct all
vnoremap a <esc>ggVG

" ynk slctd
vnoremap o :call V_ynk()<cr>
vnoremap c :call V_ynk()<cr>
"vnoremap c "0y

" clipboard slctd
"vnoremap xx "+y

" paste
vnoremap <expr> p mode() == "<c-v>" ? "I<c-r>0<esc>" : '"ad"0P'

" paste visual box
"vnoremap xx I<c-r>0<esc>

" 
" undo
" 
vnoremap h <esc>u

" 
" edit
" 

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
vnoremap :r :<c-u>InsSlctdEdge 
vnoremap :b :<c-u>InsSlctdEdge 

" ins date time
vnoremap * c<c-r>=strftime("%Y-%m-%d.%H:%M")<cr><esc>

" ins time
vnoremap T c<c-r>=strftime("%H:%M")<cr><esc>

" del str > ynk
"vnoremap d "0d
vnoremap d "0d:let @+ = @0<cr>

" del str > ynk not
vnoremap s "ax
vnoremap x "ax

" del cr
vnoremap <c-m> J

" del line end space
vnoremap D :call V_line_end_space_del()<cr>

" mv str back
vnoremap <c-w> :call V_mv_str("h")<cr>

" mv str forward
vnoremap <c-e> :call V_mv_str("l")<cr>

" mv line
"vnoremap J :call V_mv_line("j")<cr>
"vnoremap K :call V_mv_line("k")<cr>

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" num seq
vnoremap A g<c-a>

" indent shift
vnoremap # >gv
vnoremap " <gv

" indent correct
vnoremap ; =gv

" indent tab > space
vnoremap :e :!expand -t 2<cr>
"vnoremap :t :!expand -t 2<cr>

" upper / lower tgl
vnoremap u ~gv

" upper all
vnoremap U Ugv

" lower all
vnoremap <c-u> ugv

" 
" srch
" 

" srch forward ( srch rpl skip )
vnoremap <c-n> :call V_srch_slct('f')<cr>

" srch back
"vnoremap xx    :call V_srch_slct("b")<cr>

" srch str set
vnoremap n :call V_srch_str__slctd_str(v:false)<cr>
vnoremap e :call V_srch_str__slctd_str(v:false)<cr>

" srch str set ( word 1 )
vnoremap E :call V_srch_str__slctd_str(v:true)<cr>

" srch cmdline
vnoremap <leader>i "ay/<c-r>a

" srch replace all > ynk
vnoremap :s :s//<c-r>0/gc<cr>

" srch replace one > ynk, nxt
vnoremap <c-p> "ad"0Plgn

" 
" grep
" 

" grep bfr ( fzf )
vnoremap <leader>k :call V_grep_bfr()<cr>

" grep ( fzf )
vnoremap <leader>o "ay:Rg <c-r>a<cr>

" grep func define ( fzf )
"vnoremap <leader>xx "ay:Rg <c-r>a<cr>func

" grep [rg]   ( read )
vnoremap :g "ay:GrepStr <c-r>a
vnoremap :G "ay:GrepWrd <c-r>a

" tag jmp
vnoremap t :call V_tag_jmp()<cr>

" 
" nop
" 
"vnoremap <space> <nop>

" 
" esc
" 
vnoremap @ <esc>
"vnoremap * <esc>
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
"vnoremap h <esc>
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
"vnoremap D <esc>
"vnoremap F <esc>
vnoremap H <esc>
"vnoremap I <esc>
vnoremap J <esc>
vnoremap K <esc>
vnoremap L <esc>
vnoremap M <esc>
vnoremap N <esc>
"vnoremap O <esc>
vnoremap P <esc>
vnoremap Q <esc>
vnoremap R <esc>
vnoremap S <esc>
"vnoremap U <esc>
vnoremap V <esc>
vnoremap Y <esc>

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
"vnoremap gj <esc>
"vnoremap gk <esc>
"vnoremap go <esc>

"
" mode insert
"

" quit, esc
inoremap <expr> <esc>
\ pumvisible()            ? "<c-e>"  :
\ Is_cursor_line_top0() ? "<esc>"  :
\                           "<esc>l"
inoremap <c-c> <esc>

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
"inoremap xx <c-o>e<c-o>l

" cursor mv word back
"inoremap xx <c-o>b

" cursor mv d
inoremap <c-n> <c-o>j
"inoremap <c-n> <down>

" cursor mv u
inoremap <c-p> <c-o>k
"inoremap <c-p> <up>

" del line
" non

" del char forward
inoremap <c-d> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word back
inoremap <c-w> <c-w>

" del word forword
"inoremap <expr> <c-k>
"\ pumvisible()         ? "<c-p>"   :
"\ col(".") != col("$") ? "<c-o>dw" :
"\                        ""

" ins cr
inoremap <c-m> <cr>

" ins markdown cr
inoremap <c-q> <space><space>
inoremap <c-r> <space><space>
inoremap <tab> <space><space>

" ins tab
inoremap <s-tab> <c-v><tab>

" paste
"inoremap <c-v> <c-r>0

" paste clipboard
inoremap <c-v> <c-r>+

" input complete
inoremap <expr> <c-y> pumvisible() ? "<c-e>" : "<c-n>"

"   clear
"inoremap <expr> <esc> pumvisible() ? "<c-e>"  : ""
"inoremap <expr> <c-w> pumvisible() ? "<c-e>"  : "<c-w>"

" ins bracket
"inoremap < <><c-o>h
"inoremap ( ()<c-o>h
"inoremap { {}<c-o>h
"inoremap [ []<c-o>h
"inoremap " ""<c-o>h
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
inoremap <c-u> <c-r>=I_symbol()<cr>

" ins bracket
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<c-r>=I_bracket()<cr>"

" ins markdown
inoremap <expr> <c-k>
\ pumvisible() ? "<c-p>" :
\                "<c-r>=I_markdown()<cr>"

" ins num
"inoremap xx <c-r>=I_num()<cr>

" ins register
"inoremap xx <c-r>=I_reg()<cr>

" ins lua reserved word
"inoremap xx <c-r>=I_lua_reserved()<cr>

" ins ooq ( lua )
"inoremap <c-u> <c-r>=I_usual()<cr>

" 
" nop
" 

"inoremap <tab> <nop>
"inoremap <s-tab> <nop>

inoremap <c-_> <nop>
"inoremap <c-:> <nop> " non
"inoremap <c-;> <nop>

inoremap <c-b> <nop>
"inoremap <c-g> <nop>
"inoremap <c-k> <nop>
"inoremap <c-n> <nop>
"inoremap <c-p> <nop>
"inoremap <c-q> <nop>
"inoremap <c-r> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>

" 
" ins fnc
" 

func! I_symbol() abort

  let l:lst = ['%', '&', '\', '@', '?', '/']

  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_bracket() abort
  call complete( col('.'), [ '()', "''", '[]', '""', '<>', '{}' ])
  return ''
endfunc

func! I_markdown() abort
  call complete( col('.'), [ '- ', '- [ ] ', '```', '``', '---' ])
  return ''
endfunc

func! I_num() abort
  call complete(col('.'), ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
  return ''
endfunc

func! I_reg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc

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

nnoremap <leader>f <esc>
nnoremap <leader>h <esc>
"nnoremap <leader>p <esc>
nnoremap <leader>r <esc>
nnoremap <leader>u <esc>
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
func! Grep(opt, p_str) abort
  
  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = a:opt
  endif
  
  if a:p_str != ''
    let l:str = trim(a:p_str)
  else
    let l:str = @/
  endif
  
  let l:str = escape(l:str, '\({')

  let l:exe_str = 'r! rg -n -s "'.l:str.'"'
  \           . ' -g "*.lua"  -g "*.script" -g "*.gui_script"'
  \           . ' -g "*.txt"  -g "*.json"   -g "*.fish" -g "*.vim"'
  \           . ' -g "*.html" -g "*.js"     -g "*.css"  -g "*.md" '
  \           . ' ' . l:opt
  
  "echo l:exe_str
  "let @+ = l:exe_str
  
  call Opn_grep_work()
  exe l:exe_str
endfunc

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
Plug 'jacquesbh/vim-showmarks'
Plug 'mattn/vim-molder'
"Plug 'mattn/vim-molder-operations'
"Plug 'tyru/open-browser.vim'
"Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" do
" :PlugInstall
" or
" :PlugClean

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
\     ."-- ".shellescape(escape(<q-args>, '().')),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

" grep bfr
func! N_grep_bfr() abort
  
  exe 'BLines '
endfunc

func! V_grep_bfr() abort

  call V_srch_str__slctd_str(v:false)
  exe 'BLines ' . escape(@a, '.*~')
endfunc

command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(
\   <q-args>,
\   {'options': ['--no-sort', '--exact']},
\   <bang>1
\ )

" files
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" file history
command! -bang -nargs=* FileHstry
\ call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" cmd history
command! -bang -nargs=* CmdHstry
\ call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" srch history
command! -bang -nargs=* SrchHstry
\ call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" mark
command! -bang -nargs=* Mark
\ call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)

" rgstr history
command! -bang -nargs=* RgstrHstry
\ call Rgstr_fzf()

func! Rgstr_fzf()
  
  let l:rgstr_info = execute(':reg')->split("\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
  \   {
  \     'source': l:rgstr_info,
  \     'sink'  : funcref('Rgstr__paste_by_rgstr_info'),
  \     'window': '-tabnew'
  \   }
  \ )
endfunc

func! Rgstr__paste_by_rgstr_info(rgstr_info) abort
  
  let l:rgstr_name = strcharpart(a:rgstr_info, 5, 2)
  exe 'normal! ' . l:rgstr_name . 'P'
endfunc

" ctags ( fzf )

"nnoremap xx :Tags <c-r><c-w><cr>
"vnoremap xx "ay:Tags <c-r>a<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)

set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap xx :!sh sh/ctags.sh

" plugin  #end#

"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o


" 
" vim script fnc
" 

" primitive

func! Exe(cmd) abort

  exe a:cmd
endfunc

func! Normal(cmd) abort

  call Exe('normal! ' . a:cmd)
endfunc

func! Ins(str) abort

  let l:cmd = 'i' . a:str
  call Normal(l:cmd)
  call Normal('l')
endfunc

func! Ins_mlt(str, num) abort

  let l:cmd = a:num.'i'.a:str
  call Normal(l:cmd)
endfunc

func! Int_2_str(num) abort

  let l:num_str = printf('%o', a:num)
  return l:num_str
endfunc

func! Rgstr__clr() abort

  let @0 = ''
endfunc

func! Save() abort
  
  call Exe('w')
endfunc

" cursor

func! Cursor__mv_line_top0() abort
  
  if ! Is_line_emp()
    call Normal('0')
  end
endfunc

func! Cursor__mv_line_top1() abort

  if Is_line_space()
    call N_cursor__mv_line_end()
  else
    call Normal('^')
  end
endfunc

func! N_cursor__mv_line_end() abort

  if ! Is_line_emp()
    call Normal('$l')
  end
endfunc

func! N_cursor__mv_word_f() abort

  if Is_cursor_line_end()
    call Normal('l')
    return
  endif

  let l:c_char = Cursor_c_char()
  let l:r_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:r_char =~ ' '
    call Normal('w')
  else
    call Normal('el')
  end
endfunc

func! N_cursor__mv_word_b() abort
  
  let l:c_l = Cursor_l_char()
  echo l:c_l
  
  if     Is_cursor_line_top0()
    call Normal('k')
    call N_cursor__mv_line_end()
    
  elseif Is_line_space()
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_line_top1()
    call Cursor__mv_line_top0()
    
  elseif l:c_l =~ '\S' && l:c_l =~ '\W' " symbol
    call Normal('h')
    
  "elseif l:c_l =~ '\s'
    "normal! ge
    
  "elseif l:c_l =~ '\W'
    "normal! h
  else
    call Normal('b')
  end
endfunc

func! N_cursor__mv_word_b_pre() abort

  let l:c_char = Cursor_c_char()
  let l:l_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:l_char !~ ' '
    call Normal('gegel')
  else
    call Normal('gel')
  end
endfunc

func! Cursor__mv_by_pos(pos) abort
  
  call setpos('.', a:pos)
endfunc

func! Cursor__mv_by_lc(line, col) abort
  
  call cursor(a:line, a:col)
endfunc

func! N_cursor__mv_line_top_or_new_line() abort

  if Is_cursor_line_top1()
    
    call N_ins_line_emp()
    "call Indnt__crct()
  else
    call Cursor__mv_line_top1()
  end
endfunc

" cursor cnd

func! Is_cursor_line_end() abort

  if col('.') == col('$')
    return v:true
  else
    return v:false
  end
endfunc

func! Is_cursor_line_top0() abort
  
  if col('.') == 1
    return v:true
  else
    return v:false
  end
endfunc

func! Is_cursor_line_top1() abort
  
  let l:pos_c = getpos('.')
  
  let l:col_c = col('.')
  
  call Cursor__mv_line_top1()
  let l:col_s1 = col('.')
  
  call setpos('.', l:pos_c)
  
  if l:col_c == l:col_s1
    return v:true
  else
    return v:false
  end
endfunc

" line

func! Line_num() abort " alias

  return line('.')
endfunc

func! Line_str() abort " alias

  return getline('.')
endfunc

func! Line_l() abort
  
  let l:line_l = getline('.')[:col('.')-2]
  return l:line_l
endfunc

func! Line_r() abort
  
  let l:line_r = getline('.')[col('.'):]
  return l:line_r
endfunc

func! Line_top1__ins(str) abort

  call Cursor__mv_line_top1()
  call Ins(a:str)
endfunc

func! Line_end__del_space(line_num) abort
  
  call Exe(a:line_num . 's/[ \t]*$//g')
endfunc

" line cnd

func! Is_line_emp() abort
  
  if col('$') == 1
    return v:true
  else
    return v:false
  end
endfunc

func! Is_line_space() abort
  
  let l:idx = match(Line_str(), '^\s*$')
  if l:idx == 0
    return v:true
  else
    return v:false
  end
endfunc

" indnt

func! Indnt_col_by_c() abort

  let l:col = cindent(Line_num()    )
  return l:col
endfunc

func! Indnt__add(col) abort

  call Normal('0')
  call Ins_mlt(' ', (a:col))

  call Cursor__mv_line_top1()
endfunc

func! Indnt__del() abort " alias

  call Exe('left')
endfunc

func! Indnt__shft_r() abort " nnoremap # >>

  if Is_line_emp()
    let l:col = Indnt_col_by_c()
  else
    let l:col = 2
  endif

  call Indnt__add(l:col)
endfunc

func! Indnt__shft_l() abort

  call Normal('<<')
  call Cursor__mv_line_top1()
endfunc

func! Indnt__crct() abort

  call Indnt__del()
  call Indnt__crct_by_c()
endfunc

func! Indnt__crct_by_c() abort

  let l:col = Indnt_col_by_c()
  call Indnt__add(l:col)
endfunc

" slct

func! Slct_word() abort

  let l:c = Cursor_c_char()

  if     l:c =~ '\w'
    call Normal('viw')

  elseif l:c =~ ' '
    call Normal('vwh')
  else
    call Normal('v')
  endif
endfunc

func! Slct_by_pos(s_pos, e_pos) abort

  call Cursor__mv_by_pos(a:s_pos)
  normal! v
  call Cursor__mv_by_pos(a:e_pos)
endfunc

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort
  
  let l:s_line = (a:s_line == 0) ? Line_num() : a:s_line
  let l:e_line = (a:e_line == 0) ? Line_num() : a:e_line

  call Cursor__mv_by_lc(a:s_line, a:s_col)
  normal! v
  call Cursor__mv_by_lc(a:e_line, a:e_col)
endfunc

" ynk

func! Ynk__clipboard() abort

  let @0 = @+
endfunc

func! Clipboard__ynk() abort

  let @+ = @0
endfunc

func! N_ynk() abort

  call Normal('"0yy')
  call Normal('"+yy')
  
  "l:line_str = Line_str()
  "let @0 = l:line_str
  "let @+ = l:line_str
endfunc

func! V_ynk() abort

  call Normal('gv"0y')
  call Normal('gv"+y')
  
  "let l:str = V_slctd_str()
  "let @0 = l:str
  "let @+ = l:str
endfunc

" grep

command! -nargs=? GrepStr call Grep_str(<q-args>)

func! Grep_str(str) abort
  
  call Grep(v:null, a:str)
endfunc

command! -nargs=? GrepWrd call Grep_wrd(<q-args>)

func! Grep_wrd(str) abort
  
  call Grep('-w'  , a:str)
endfunc

" markdown

func! Ins__markdown_itm() abort

  let l:str = '- '
  call Line_top1__ins(l:str)
endfunc

func! Char__tgl_markdown_chk() abort
  
  if Cursor_l_char() != '[' || Cursor_r_char() != ']'
    return
  endif
  
  let l:cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' '
    let l:rpl_char = 'x'
  else
    let l:rpl_char = ' '
  endif
  
  call Char__rpl(l:rpl_char)
endfunc

func! Markdown_2_html() abort
  
  if &filetype != 'markdown'
    return
  endif
  
  let l:path = expand('%')
  
  call Exe('! node ~/sh/nodejs/md_2_html.js ' . l:path)
  
  "call Opn_app(l:path . '.html')
endfunc

" etc

func! Rg_out_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  return l:ret
endfunc

func! Buf_nr() abort

  return bufnr('%')
endfunc

func! Tag_jmp(rg_out_line) abort
  
  let l:rg_out_line = trim(a:rg_out_line)

  if l:rg_out_line == ''
    return
  end
  
  let l:rg_out_line = matchstr(l:rg_out_line, '\S\+')
  
  let l:rg_out_line_ar = Rg_out_parse(l:rg_out_line)
  let l:filename = l:rg_out_line_ar[0]
  let l:line_num = get(l:rg_out_line_ar, 1, 1)

  if ! filereadable(l:filename)
    return
  end

  exe "tab drop " . l:filename
  call Normal(l:line_num . 'G')
endfunc

func! N_tag_jmp() abort

  let l:base_buf_nr = Buf_nr()

  let l:line = Line_str()
  call Tag_jmp(l:line)

  exe "sbuffer " . l:base_buf_nr
  call Normal('j')
endfunc

func! V_tag_jmp() range abort

  let l:base_buf_nr = Buf_nr()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(line_num)
    call Tag_jmp(l:line)

    exe "sbuffer " . l:base_buf_nr
  endfor
endfunc

func! Slct_expnd_r() abort
  
  call Cursor__mv_slctd_l()
  let l:col_c = Col()
  
  let l:ptn = '[' . "'" . '"' . ')' . '\]' . ']'
  
  let l:line_r = Line_r()
  let l:r_idx  = match(l:line_r, l:ptn)
  
  if l:r_idx == -1
    return
  endif
  
  let l:c = l:line_r[l:r_idx]
  "echo l:c l:r_idx
  
  let l:slct_col_r = l:col_c + l:r_idx
  
  if l:r_idx == 0
    let l:slct_col_r += 1
  endif
  
  call Slct_by_line_col(0, l:col_c, 0, l:slct_col_r)
  
endfunc
  
func! Slct_expnd() abort

  " todo refactoring use Slct_expnd()
  
  call Cursor__mv_slctd_r()
  
  let l:ptn = '[' . "'" . '"' . ')' . '\]' . ']'
  
  let l:line_r = Line_r()
  let l:r_idx  = match(l:line_r, l:ptn)
  "echo l:r_idx
  
  if l:r_idx == -1
    return
  endif
  
  let l:c = l:line_r[l:r_idx]
  "echo l:c l:r_idx
  
  if l:c == '"' || l:c == "'"
    
    let l:line_l = Line_l()
    let l:l_idx = strridx(l:line_l, l:c)
    
    if l:l_idx == -1
      return
    endif
    
    let l:word_col_l =         l:l_idx + 2
    let l:word_col_r = Col() + l:r_idx
    
    if l:r_idx == 0
      let l:word_col_l -= 1
      let l:word_col_r += 1
    endif
    
    call Slct_by_line_col(0, l:word_col_l, 0, l:word_col_r)
    
  elseif l:c == ')'
    normal! vi(
    
  elseif l:c == ']'
    normal! vi[
  endif
endfunc

func! Col() abort " alias
  
  return col('.')
endfunc

func! Cursor_c_char() abort

  let l:c = getline('.')[col('.')-1]
  return l:c
endfunc

func! Cursor_r_char() abort

  let l:c = getline('.')[col('.')]
  return l:c
endfunc

func! Cursor_l_char() abort

  let l:c = getline('.')[col('.')-2]
  return l:c
endfunc

func! N_line__del() abort
  
  if Line_str() =~ '^\s*$'
    call Normal('"add')
  else
    call Normal('"0dd')
    call Clipboard__ynk()
  endif
endfunc

func! V_line_del() abort " todo mod , use not
  
  "exe 'normal! "0d'
  "normal! gv"0d
  
  normal! gvj
  "normal! "0d
  
  call Clipboard__ynk()
endfunc

" 
" char __ 
" 

func! Char__rpl(rpl) abort

  call Normal('r' . a:rpl)
endfunc

func! N_char__tgl() abort

  let l:c   = Cursor_c_char()
  let l:rpl = Char__tgl1(l:c)

  if l:rpl == ''
    call Normal('v~')
    return
  endif

  call Char__rpl(l:rpl)
endfunc

func! N_char__tgl2() abort " use not

  let l:c   = Cursor_c_char()
  let l:rpl = Char__tgl_trn(l:c)

  if l:rpl == ''
    call Normal('v~')
    return
  endif

  call Char__rpl(l:rpl)
endfunc

func! Char__tgl1(c) abort

  "let l:rpl = Char__tgl_bracket(a:c)
  let l:rpl = Char__tgl_trn(a:c)

  if l:rpl != ''
    return l:rpl
  endif

  let l:rpl = Char__tgl_etc(a:c)
  if l:rpl != ''
    return l:rpl
  endif

  return l:rpl
endfunc

func! Char__tgl_bracket(c) abort " use not

  let l:rpl = ''

  if     a:c == '('
    let l:rpl = '['
  elseif a:c == ')'
    let l:rpl = ']'

  elseif a:c == '['
    let l:rpl = '{'
  elseif a:c == ']'
    let l:rpl = '}'

  elseif a:c == '{'
    let l:rpl = '<'
  elseif a:c == '}'
    let l:rpl = '>'

  elseif a:c == '<'
    let l:rpl = '('
  elseif a:c == '>'
    let l:rpl = ')'
  endif

  return l:rpl
endfunc

func! Char__tgl_etc(c) abort

  let l:rpl = ''

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

  elseif a:c == '*'
    let l:rpl = '+'
  elseif a:c == '+'
    let l:rpl = '*'

  elseif a:c == ','
    let l:rpl = '.'
  elseif a:c == '.'
    let l:rpl = ','

  elseif a:c == ';'
    let l:rpl = ':'
  elseif a:c == ':'
    let l:rpl = ';'

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
  endif

  return l:rpl
endfunc

func! Char__tgl_trn(c) abort
  
  let l:rpl = ''

  if     a:c == '<'
    let l:rpl = '>'
  elseif a:c == '>'
    let l:rpl = '<'

  elseif a:c == '{'
    let l:rpl = '}'
  elseif a:c == '}'
    let l:rpl = '{'

  elseif a:c == '['
    let l:rpl = ']'
  elseif a:c == ']'
    let l:rpl = '['

  elseif a:c == '('
    let l:rpl = ')'
  elseif a:c == ')'
    let l:rpl = '('
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

func! Cursor_word() abort

  let l:word = expand("<cword>")
  return l:word
endfunc

func! Cursor_filepath() abort

  if has('mac')
    let l:str = expand("<cfile>")
  else
    let l:str = Line_str()
  endif
  
  let l:str = trim(l:str)
  
  return l:str
endfunc

func! V_mv_str(lr) abort

  call Normal('gv"ax' . a:lr . '"aP')

  call Normal('v')

  let l:mv_len = Str_len(@a) - 1
  if l:mv_len <= 0
    return
  endif

  call Normal(l:mv_len . 'h')
endfunc

func! V_mv_line(ud) range abort

  let l:mv_num   = a:lastline - a:firstline
  let l:line_num = l:mv_num + 1

  exe 'normal! ' . a:firstline . 'G'
  exe 'normal! ' . l:line_num . '"add'
  exe 'normal! ' . a:ud
  call Normal('"aP')
  call Normal('V')

  if l:mv_num >= 1
    call Normal(l:mv_num . 'j')
  endif
endfunc

func! Cursor__mv_slctd_l() abort
  
  call Normal('`<')
endfunc

func! Cursor__mv_slctd_r() abort
  
  call Normal('`>')
endfunc

func! Slct_re() abort " todo mod
  
  call Normal('gv')
endfunc

func! Slctd_pos() abort " use not
  
  call Slct_re()
  let l:pos = getpos('.')
  
  exe "normal! \<esc>"
  
  return l:pos
endfunc

func! V_slctd_str() abort

  call Normal('gv"ay')
  return @a
  
  " return @* " ??
endfunc

func! V_slctd_str_len() abort

  "let l:slctd_str = V_slctd_str()
  let l:len = strchars(V_slctd_str())
  return l:len
endfunc

command! -nargs=? InsSlctdEdge call V_ins_slctd_edge(<q-args>)
func! V_ins_slctd_edge(c) abort " use not
  
  if     a:c   == '('
    let  l:c_l =  '('
    let  l:c_r =  ')'
  elseif a:c   == '['
    let  l:c_l =  '['
    let  l:c_r =  ']'
  elseif a:c   == '{'
    let  l:c_l =  '{'
    let  l:c_r =  '}'
  elseif a:c   == '<'
    let  l:c_l =  '<'
    let  l:c_r =  '>'
  else
    let  l:c_l = a:c
    let  l:c_r = a:c
  endif
  
  call V_ins_slctd_r(l:c_r)
  call V_ins_slctd_l(l:c_l)
endfunc

func! V_ins_slctd_l(c) abort

  call Normal('`<')
  call Ins(a:c)
endfunc

func! V_ins_slctd_r(c) abort

  call Normal('`>l')
  call Ins(a:c)
endfunc

func! N_srch_str__(word1) abort

  let l:str = Cursor_word()

  "if a:word1
    "let l:str = Srch_str_word1(l:str)
  "endif
  
  call Srch_str__(l:str, a:word1)
endfunc

func! V_srch_str__slctd_str(word1) abort

  let l:str = V_slctd_str()

  "if a:word1
    "let l:str = Srch_str_word1(l:str)
  "endif
  
  call Srch_str__(l:str, a:word1)
endfunc

func! Srch_str_word1(str)

  let l:str = a:str
  
  if Str_l(l:str) =~ '\w'
    let l:str = '\<' . l:str
  endif
  
  if Str_r(l:str) =~ '\w'
    let l:str =        l:str . '\>'
  endif
  
  "echo l:str
  return l:str
endfunc

func! Str_len(str)

  return strchars(a:str)
endfunc

func! Str_l(str)
  
  let l:l_idx = 0
  let l:str_l = a:str[l:l_idx]
  "echo l:str_l
  return l:str_l
endfunc

func! Str_r(str)
  
  let l:r_idx = Str_len(a:str) - 1
  let l:str_r = a:str[l:r_idx]
  "echo l:str_r
  return l:str_r
endfunc

"let g:srch_init_flg = v:false
"let g:srch = ''

func! Srch_str__(str, word1) abort
  
  echo a:str
  let l:str  = escape(a:str, '.*~[]\')
  
  if a:word1
    let l:str = Srch_str_word1(l:str)
  endif
  
  let g:srch_prv1 = @/
  let @/ = l:str
  
  " todo del
  "if ! g:srch_init_flg
  "  exe "normal! /\<cr>N"
  "  let g:srch_init_flg = v:true
  "endif
endfunc

func! N_srch_str__prv() abort

  let l:tmp = @/
  
  let @/ = g:srch_prv1
  
  let g:srch_prv1 = l:tmp
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

  if ! V_is_slctd_eq_srch_str()
    call V_srch_str__slctd_str(v:false)
  endif
endfunc

func! N_srch_slct(dir) abort " use not

  if     a:dir == 'f'
    call Normal('gn')

  elseif a:dir == 'b'
    call Normal('gN')
  endif
endfunc

func! V_srch_slct(dir) abort

  if     a:dir == 'f'
    call Normal('`>lgn')

  elseif a:dir == 'b'
    call Normal('`<hgN')
  endif
endfunc

func! Cmnt_1(head) abort

  let l:str_df = {
  \ "lua" : '-- '      ,
  \ "text": '# '       ,
  \ "vim" : '"'        ,
  \ "fish": '#'        ,
  \ "sh"  : '#'        ,
  \ "css" : '/* '      ,
  \ "javascript": '// '
  \ }
  let l:dflt = '# '
  let l:str = get(l:str_df, &filetype, l:dflt)

  call Normal(a:head . 'i' . l:str)
  
  "call Normal('0')
  call Normal('^')
endfunc

func! N_cmnt_1() abort

  call Cmnt_1('^')
endfunc

func! V_cmnt_1() range abort

  for line_num in range(a:firstline, a:lastline)

    call Normal(line_num . 'G')
    call Cmnt_1('0')
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

  call Cmnt_mlt('bgn')
  call Cmnt_mlt('end')
endfunc

func! V_cmnt_mlt() range abort

  call Normal(a:lastline  . 'G')
  call Cmnt_mlt('end')

  call Normal(a:firstline . 'G')
  call Cmnt_mlt('bgn')
endfunc

func! V_line_end_space_del() abort

  call Exe('s/[ \t]*$//g')
endfunc

func! V_line_end_padding() range abort
  
  let l:char = ' '
  let l:w    = 75

  for line_num in range(a:firstline, a:lastline)
    
    call Normal(line_num . 'G')
    
    let l:col = col('$')
    let l:len = l:w - l:col
    
    call Normal(l:len . 'A' . l:char)
  endfor
endfunc

command! -nargs=? -complete=dir Lf call Lf(<q-args>)
func! Lf(dir) abort

  let l:exe = 'r! lf ' . trim(a:dir)
  exe l:exe
endfunc

func! Slf_path() abort
  
  let l:path = expand('%:p')
  return l:path
endfunc

" ins str

func! N_ins_cr() abort
  
  let l:t_line_num = line('.')
  
  exe "normal! i\<cr> "
  exe 'normal! x'
  
  call Line_end__del_space(l:t_line_num)
  exe 'normal! j'
endfunc

" ins line

func! N_ins_line(str) abort
  
  let l:line_num = Line_num() - 1
  call append(l:line_num, a:str)
  exe 'normal! k'
endfunc

func! N_ins_line_emp() abort
  
  let l:str = ''
  call N_ins_line(l:str)
  
"  exe 'normal! O '
"  exe 'normal! x'
endfunc

func! N_ins_line_slf_path() abort
  
  let l:path = Slf_path()
  call N_ins_line(l:path)
endfunc

" tmp file

func! Tmp_cre() abort " alias

  let l:tmp_path = Tmp_cre_sys()
  return l:tmp_path
endfunc

func! Tmp_cre_sys() abort

  let l:tmp_path = system('mktemp ')
  return l:tmp_path
endfunc

" 
" opn file
" 

command! -nargs=* -complete=file Opn call Opn(<q-args>)
func! Opn(filename) abort

  exe 'tab drop ' . a:filename
endfunc

func! Opn_tmp() abort

  let l:path = Tmp_cre()
  echo l:path
  call Opn(l:path)
endfunc

func! Opn_vimrc() abort

  let l:path = '~/.vimrc'
  call Opn(l:path)
endfunc

func! Opn_app_slf() abort

  let l:path = Slf_path()
  "echo l:path

  call Opn_app(l:path)
endfunc

func! Opn_vim_key() abort

  let l:path = '~/doc/tech/vim/m.key.default.txt'
  call Opn(l:path)
endfunc

func! Opn_grep_work() abort

  let l:path = 'doc/grep.lua'
    
  if getftype(l:path) == ''

    call Opn(l:path)
  else
    call Opn_tmp()
  endif
endfunc

func! Opn_memo() abort

  let l:path = 'doc/memo.txt'
  call Opn(l:path)
endfunc

func Opn_app(path)
  
  let l:path = a:path
  
  if has('mac')
    let l:res = system('open     ' . "'" . l:path . "'")
  else
    let l:res = system('explorer ' . "'" . l:path . "'")
  endif
endfunc

func Opn_app_by_path()
  
  let l:path = Cursor_filepath()
  call Opn_app(l:path)
endfunc

func V_opn_app()
  
  let l:path = V_slctd_str()
  
  let l:path = trim(l:path)
  
  call Opn_app(l:path)
endfunc

" mark

let g:mark_alph_def = [
\   'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
\   'o','p','q','r','s','t','u','v','w','x','y','z'
\ ]

func! Mark_show_tgl() abort
  
  if exists('g:mark_show_flg') == 0
    
    let g:mark_show_flg = v:false
  endif
  
  if ! g:mark_show_flg
    
    exe 'DoShowMarks'
    let g:mark_show_flg = v:true
  else
    exe 'NoShowMarks'
    let g:mark_show_flg = v:false
  endif
endfunc

func! Mark_lst() abort
  
  let l:mark = []
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    let l:mark = add(l:mark, l:_mark['mark'][1])
  endfor
  "echo l:mark
  return l:mark
endfunc

func! Mark_alph_line() abort
  
  let l:line_c = line('.')
  
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    if l:_mark['pos'][1] == l:line_c
      "echo l:_alph
      return l:_alph
    endif
  endfor
  return ''
endfunc

func! Mark_tgl() abort
  
  let l:alph = Mark_alph_line()
  "echo 'Mark_tgl ' . l:alph
  
  if l:alph == ''
    call Mark_add()
  else
    call Mark_del(l:alph)
  endif
  
  exe 'DoShowMarks'
endfunc
  
func! Mark_add() abort
  
  let l:alph = Mark_alph_useabl()
  exe 'mark ' . l:alph
endfunc

func! Mark_alph_useabl() abort
  
  let l:mark = Mark_lst()
  
  for _alph in g:mark_alph_def
    if count(l:mark, _alph) == 0
      "echo _alph
      return _alph
    endif
  endfor
  
  echo 'use alph all'
  return ''
endfunc

func! Mark_del(alph) abort
  
  exe 'delmark ' . a:alph
endfunc

func! Mark_del_all() abort
  
  exe 'delmark!'
  exe 'DoShowMarks'
endfunc

func! Hl_grp() abort

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunc
" and
" :highlight [grp name]

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc


" 
" init
" 

" ynk init
call Ynk__clipboard()

" netrw " use not

hi netrwDir      ctermfg=lightgreen
hi netrwTreeBar  ctermfg=lightgreen
hi netrwClassify ctermfg=lightgreen
hi netrwComment  ctermfg=14         ctermbg=none    cterm=none
hi netrwList     ctermfg=yellow     ctermbg=none    cterm=none
hi netrwVersion  ctermfg=130        ctermbg=none    cterm=none
hi netrwHelpCmd  ctermfg=130        ctermbg=none    cterm=none


" 
" win
" 
let g:vimrc_win_path = '~/.vimrc_win'

if filereadable(expand(g:vimrc_win_path))

  "exe 'source ' . g:vimrc_win_path
  Exe('source ' . g:vimrc_win_path)
  echo 'read .vimrc_win'
endif


