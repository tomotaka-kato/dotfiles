#Requires AutoHotkey v2.0

; 現在フォーカスが当たっているウィンドウの縁をハイライトする

; ボーダーの描画
DrawBorder(hwnd, color:=0xFF0000, enable:=1) {
    static DWMWA_BORDER_COLOR := 34
    static DWMWA_COLOR_DEFAULT	:= 0xFFFFFFFF
    R := 2
    G := 219
    B := 187
    color := (B << 16) | (G << 8) | R
    DllCall("dwmapi\DwmSetWindowAttribute", "ptr", hwnd, "int", DWMWA_BORDER_COLOR, "int*", enable ? color : DWMWA_COLOR_DEFAULT, "int", 4)
}

Loop
{
    window_ids := WinGetList()
    active_id := WinExist("A")
    for id in window_ids
    {
        DrawBorder(id, 0x00FF00, id == active_id)
    }
    Sleep 100
}

