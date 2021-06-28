# 言語設定
set -x LANG 'ja_JP.UTF-8'
set -x LC_ALL 'ja_JP.UTF-8'
set -x LC_MESSAGES 'ja_JP.UTF-8'

set -x PATH /Applications $PATH

# alias
alias vim nvim
alias cddev "cd ~/dev/src/github.com/tomotaka-kato"
alias cdbacklog "cd ~/dev/src/smileforce.git.backlog.jp"
alias cat bat
alias icat "kitty +kitten icat --align left"
alias tig "tig --all"

# fzfのコマンドに隠しファイルなども含める
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"


# add path to tools
set -x PATH $HOME/.nodebrew/current/bin $PATH

# zlib
set -x LDFLAGS "-L/usr/local/opt/zlib/lib" 
set -x CPPFLAGS "-I/usr/local/opt/zlib/include"

# pyenv
status --is-interactive; and source (pyenv init -|psub)
# source (pyenv virtual-env init -|psub)

# GO
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH


# Rust
set -x PATH $HOME/.cargo/bin $PATH


# dotnet-sdkの情報を共有しない
set -x DOTNET_CLI_TELEMETRY_OPTOU 1

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -x PATH /usr/local/opt/llvm/bin $PATH
set -g fish_user_paths "/usr/local/opt/luajit-openresty/bin" $fish_user_paths


# rangerが開くテキストエディタの設定
set -x EDITOR "nvim"
