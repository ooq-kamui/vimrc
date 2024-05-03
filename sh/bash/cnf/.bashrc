
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export PS1="_ "

PATH=$PATH:~/wrk/cnf/sh/bash/cmd

export LSCOLORS=fxgxcxdxxxegedabagacad
#               ^dir    ^exe
#                 ^lnk?
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey


# key bind

if [[ -t 0 ]]
then
  stty stop  undef
  stty start undef

  bind '"\C-f": forward-word'
  bind '"\C-o": backward-word'
  
  bind '"\C-l": forward-char'
  bind '"\C-s": backward-char'
  
  bind '"\C-k": kill-word'
  
  bind -x '"\C-u": cmd_line__bracket'
  bind -x '"\C-b": cmd_line__bracket'

  bind -x '"\C-v": clp_paste'

  bind -x '"\C-y": fzf-file-widget'
  bind -x '"\C-r": fzf-history-widget'
  bind -x '"\C-q": fzf-history-widget'
fi


# alias

alias clr='clear'
alias c='clr'

alias clp_mac='pbcopy'
alias clp='clp_by_tmp'
#alias clp='clp_mac'

alias x='xargs'

alias src='source'

alias p='pth'

alias ls='ls -a'
alias ll='ls -lgohAGD "%Y-%m-%d %H:%M"'

alias lf='lrf'
alias ld='lrd'

alias cd_parent='cd ..; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'

alias dir='z'

alias psh='pushd'
alias pop='popd'
alias pp='popd'

alias mv='mv -i'

alias cp='cp -pi'

alias to='touch'
alias to_clr=':>'

alias vi='vi -p'

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias srt='sort'

alias tbl='column -t'

alias ca='cal'

alias du1='du -h --max-depth=1'
#alias du1='du -h -d 1'

alias ggl='opn https://google.com/'
alias opn_brwsr='ggl'

# fd

alias fd='fd --hidden --follow -I --exclude .git'

# rg

export RIPGREP_CONFIG_PATH=~/.ripgreprc

alias rg='rg -nS --path-separator "//"'

# fzf

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow -I --exclude .git'
#export FZF_DEFAULT_OPTS='--ansi'
export FZF_DEFAULT_OPTS='--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'


# fnc

cmd_line__bracket(){

  READLINE_LINE='vi $( '"$READLINE_LINE"' )'
  READLINE_POINT=2
}

clp_paste(){

  clp_str=aaa

  READLINE_LINE="$READLINE_LINE $clp_str"
}


#alias cnf

alias src_bashrc='src ~/.bashrc'
alias src_cnf='src_bashrc'


[ -f ~/wrk/cnf/bash/cnf/.bashrc_gitbash ] && source ~/wrk/cnf/bash/cnf/.bashrc_gitbash

[ -f ~/.bashrc_env ] && source ~/.bashrc_env



