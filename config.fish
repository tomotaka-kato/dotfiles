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

# alias
alias vim nvim

# GO
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH


# dotnet-sdkの情報を共有しない
set -x DOTNET_CLI_TELEMETRY_OPTOU 1


# PROOFIT
set -x ASPNETCORE_ENVIRONMENT development
set -x DataSourceSettings__MedicineImageApiBaseUrl https://proofitclouddev.azure-api.net/OdpFunctions-dev2/v1.0/medicine/image
set -x DataSourceSettings__PackageDetailApiBaseUrl https://proofitclouddev.azure-api.net/OdpFunctions-dev2/v1.0/package/detail?serialCode={serialCode}
set -x DataSourceSettings__FaqPageUrl https://proofitcloudpocdev.z11.web.core.windows.net/faq/
set -x DataSourceSettings__LicensePageUrl https://proofitcloudpocdev.z11.web.core.windows.net/osslicense/
set -x DataSourceSettings__TosPageUrl https://proofitcloudpocdev.z11.web.core.windows.net/tos

# 需要予測
set -x FILE_SAVER_OUTPUT_DIRECTORY $HOME/Documents/tmp/out
set -x FILE_SAVER_READ_DIRECTORY $HOME/Documents/tmp/read
set -x FILE_SAVER_DB_DIRECTORY $HOME/Documents/tmp/database
set -x FILE_SAVER_DB_URL 'jdbc:sqlite:/Users/tomo/Documents/tmp/database/database.sqlite'
