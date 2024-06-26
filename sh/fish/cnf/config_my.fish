
# source ~/.config/fish/config.fish

set -U fish_greeting

#set -x LSCOLORS fxgxcxdxexegedabagacad
set -x LSCOLORS fxgxcxdxxxegedabagacad
#               ^dir    ^exe
#                 ^lnk?
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey


# path

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /opt/homebrew/var/nodebrew/current/bin $PATH
#set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x NODEBREW_ROOT /opt/homebrew/var/nodebrew

# ripgrep ( rg )

set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc

# fzf

set -x FZF_DEFAULT_COMMAND ( fzf_fd_def )
set -x FZF_DEFAULT_OPTS    '--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'
#set -x FZF_CTRL_T_COMMAND  ( echo $FZF_DEFAULT_COMMAND )
set -x FZF_CTRL_T_COMMAND  $FZF_DEFAULT_COMMAND
#set -x FZF_CTRL_T_OPTS
#set -x FZF_CTRL_R_OPTS

# z ( bash )
#test -f ~/wrk/app/z/z.sh && . ~/wrk/app/z/z.sh
# at mac : ^ install not, ref doc-tech

# 
# alias
# 

alias shutdown_start "sudo shutdown -r now"

# login sh ch
#   confirm : echo $SHELL
#alias login_sh__fish 'chsh -s /opt/homebrew/bin/fish'
#alias login_sh__bash 'chsh -s /bin/bash'

alias fi 'fish'

alias tmx      'tmux'
#alias tmx_init 'fi ~/sh/tmux/tmux-win-init.fish'

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias his     'history'
alias his_del 'history delete'

alias clr 'clear; pwd'
alias c   'clr'

#alias clp 'pbcopy|clp_by_tmp'

alias x 'xargs'

alias lf 'lrf'
alias ld 'lrd'

alias p 'pth'

alias to     'touch'
alias to_clr ':>'

alias mv 'mv -i'
#alias cp 'cp -pi'
alias cp 'cp -ip'
alias rm 'rm -i'

alias rn 'rename'

alias trash 'trash -F'

alias psh 'pushd'
alias pop 'popd'
alias pp  'pop'

alias cd_parent 'cd ../; pwd'
alias k   'cd_parent'
alias kk  'k;k'
alias kkk 'k;k;k'

#alias dir 'z'
alias di  'dir'

alias vim 'nvim -p'
alias vi  'nvim -p'

alias gi 'git'

set -x LC_TIME en_US
alias da      "date_ymd"
alias da_y1   "date_y 1"
alias da_y2   "date_y 2"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"

alias ca 'cal'

alias du  'du -h'
alias du1 'du -hd1'
alias df  'df -h'

alias zip_un 'unzip'

alias clc 'math'
alias tbl 'column -t'
#alias col 'awk_arg'

alias trns   'trans'
alias trns_j 'trans {ja=en}'
alias trns_e 'trans {en=ja}'

alias ba 'battery'

alias fd 'fd --hidden --follow -I --exclude .git'

alias amp 'amplify'

# alias arg ( prj )

# alias cmd path

alias uconv '/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'

# 
# bind
# 

bind \c_ 'clear; commandline -f repaint'

# corsor mv char
bind \cl forward-char
bind \cs backward-char

# corsor mv word
bind \co backward-word
bind \cf forward-word

#bind \cx backward-delete-char
bind \ck kill-word

# cmdline
bind \cc cmdline_pbcopy

bind \cb cmdline_bracket
bind \cu cmdline_bracket

#bind \c? cmdline_quote

bind \ct cmdline_date

bind \cx cmdline_his_del

# fzf

bind \cy fzf-file-widget
bind \cr fzf-history-widget

# erase
#bind -e \cr 
#bind -e \ct
#bind -e \cx 


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta



