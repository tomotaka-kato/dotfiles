#Persistent
; フォーカスの当たっているWindowをハイライトする
; V2での実装方法がわからなかったのでv1での起債をしている
myFunc := RegisterCallback("WinActivateHandler")

myHook := DllCall("SetWinEventHook"
, "UInt", 0x00000003 ; eventMin : EVENT_SYSTEM_FOREGROUND
, "UInt", 0x00000003 ; eventMax : EVENT_SYSTEM_FOREGROUND
, "UInt", 0 ; hModule : self
, "UInt", myFunc ; hWinEventProc :
, "UInt", 0 ; idProcess : All process
, "UInt", 0 ; idThread : All threads
, "UInt", 0x0003 ; dwFlags : WINEVENT_SKIPOWNTHREAD | WINEVENT_SKIPOWNPROCESS
, "UInt")

; アプリが切り替わったときに呼び出される関数
WinActivateHandler(hWinEventHook, event, hwnd, idObject, idChild, thread, time) {
    ; 現在アクティブなウィンドウを取得する
    WinGetActiveTitle, active_title

    ; すべてのウィンドウを取得する
    WinGet, windows, List

    ; 取得したウィンドウの中から、アクティブなウィンドウを探す
    Loop, %windows%
    {
        this_id := windows%A_Index%
        WinGetTitle, this_title, ahk_id %this_id%
        DrawBorder(this_id, this_title = active_title)
    }
}

; ボーダーの描画
DrawBorder(hwnd, enable:=1) {
    static DWMWA_BORDER_COLOR := 34
    static DWMWA_COLOR_DEFAULT	:= 0xFFFFFFFF
    R := 2
    G := 219
    B := 187
    color := (B << 16) | (G << 8) | R
    DllCall("dwmapi\DwmSetWindowAttribute", "ptr", hwnd, "int", DWMWA_BORDER_COLOR, "int*", enable ? color : DWMWA_COLOR_DEFAULT, "int", 4)
}
