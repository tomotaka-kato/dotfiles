# 言語設定
set -x LANG 'ja_JP.UTF-8'
set -x LC_ALL 'ja_JP.UTF-8'
set -x LC_MESSAGES 'ja_JP.UTF-8'

set -x PATH /Applications $PATH

# fzfのコマンドに隠しファイルなども含める
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"


# add path to tools
set -x PATH $HOME/.nodebrew/current/bin $PATH

# java (jenv)
set -x JENV_ROOT /usr/local/var/jenv

# pyenv
status --is-interactive; and source (pyenv init -|psub)
source (pyenv virtual-env init -|psub)

# alias
alias vim nvim

# GO
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH


# dotnet-sdkの情報を共有しない
set -x DOTNET_CLI_TELEMETRY_OPTOU 1

