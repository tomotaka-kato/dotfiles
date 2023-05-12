# start AutoHotKey
Start-Process -FilePath $HOME/scoop/shims/AutoHotKey -ArgumentList $HOME/dotfiles/AutoHotkey/hightlight_active_window_border.ahk

 # start GlazeWM
 GlazeWM --config = $HOME/dotfiles/glazewm/config.yaml
