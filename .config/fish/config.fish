# 
# source ~/.config/fish/config.fish
# 

#set -x LSCOLORS fxgxcxdxexegedabagacad
set -x LSCOLORS fxgxcxdxxxegedabagacad
#               ^dir    ^exe
#                 ^lnk?
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey

# 
# path
# 

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH 
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x RIPGREP_CONFIG_PATH ~/.ripgreprc

set -x FZF_DEFAULT_OPTS '--bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'


# 
# alias
# 

#alias l  "ls -1hAG"

alias pwd_cp "pwd | pbcopy"

alias cd_p1 "cd ../"
alias cd_p2 "cd ../../"
alias cd_p3 "cd ../../../"

alias cd_vim     "cd ~/doc/tech/github/vimrc"
alias cd_vim_swp "cd ~/.local/state/nvim/swap"

alias cd_life    "cd ~/doc/life"
alias cd_tech    "cd ~/doc/tech"
alias cd_mthr    "cd ~/doc/life/mthr"

alias cd_ooq     "cd ~/dev/ooq/g.proto/assets"
alias cd_ooq_bk  "cd ~/dev/ooq/z.proto.bk"
alias cd_ooq_web "cd ~/doc/hoby/ooq-web/artcl"

alias cd_holo      "cd ~/doc/hoby/youtube/vtuber/hololive/prj"
alias cd_holo_data "cd ~/doc/hoby/youtube/vtuber/hololive/prj/www/song/data"

alias vi  "nvim -p"
alias vim "nvim -p"

alias vi_vimrc    "vi ~/.vimrc"
alias vi_vim_swap "vi ~/.local/share/nvim/swap/"
alias vi_fish_config "vi ~/.config/fish/config.fish"
alias vi_config      "vi ~/.config/fish/config.fish"
alias vi_doc  "vi doc/memo.txt"
alias vi_life "vi ~/doc/life/doc/memo.txt"

alias shutdown_start "sudo shutdown -r now"

set -x LC_TIME en_US
alias date_ymd   "date +'%Y-%m-%d'"
alias date_ymdhm "date +'%Y-%m-%d %H:%M'"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"
alias da      "date +'%Y-%m-%d %a'"
#alias date "date +'%Y-%m-%d %H:%M %a %Z'"

alias ff "fd -tf"

alias trns "trans"
alias trns_j "trans {ja=en}"
alias trns_e "trans {en=ja}"

#alias rpl="string replace"
#alias fzf="fzf --bind=ctrl-o:accept "
#alias f="mdfind -onlyin . -name"

alias ba 'pmset -g ps | grep -oE "[0-9]+%"' # battery

alias ca 'cal'

alias gi "git"

alias opn "open"

alias opn_github_vim  "open https://github.com/ooq-kamui/vimrc"
alias opn_github_holo "open https://github.com/ooq-kamui/holo-song"

alias opn_ooq "open https://ooq.jp/"

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

# 
# bind
# 

# corsor mv char
bind \cL forward-char
bind \cS backward-char

# corsor mv word
bind \cO backward-word
bind \cF forward-word

bind \cK kill-word
#bind \cS backward-delete-char

bind \cx 'clear; commandline -f repaint'
bind \cq 'clear; commandline -f repaint'

bind \cu fzf-file-widget
bind \cy fzf-history-widget

bind \cc commandline_pbcopy
bind \cb commandline_bracket
#bind \cr commandline_bracket
bind \cg commandline_quote


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta


# 
# cd
# 
#cd ~/dev/ooq/g.proto/assets

