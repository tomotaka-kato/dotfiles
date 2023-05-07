# start AutoHotKey
Start-Process -FilePath "$HOME\scoop\shims\AutoHotKey" -ArgumentList "$($PWD.Path)\AutoHotkey\hightlight_active_window_border.ahk"

 # start GlazeWM
 GlazeWM --config = "$($PWD.Path)\glazewm\config.yaml"
