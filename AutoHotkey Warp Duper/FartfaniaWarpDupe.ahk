; Volcania Network /warp duper v1.0.
;  . Requires v2.0 of AutoHotkey.
;
; Made by PK2_Stimpy#7089
;
;
; Set the delay you want
;
delay_text_open := 100      ; The delay to wait for the chat to open
delay_warp_open := 1000     ; The delay to wait for the warp menu to open
delay_warp_close := 0      ; The delay to wait till it teleports to warp
;SPAWN=delay_warp_goto := 130       ; The delay to wait after it closes warp menu
;WARP=delay_warp_goto := 90       ; The delay to wait after it closes warp menu
delay_warp_goto := 90       ; The delay to wait after it closes warp menu

;
; DO NOT TOUCH BELOW THIS LINE
;
mouse_x := 0
mouse_y := 0
return ;

^!g::
{
    Send "T"
    Sleep delay_text_open
    Send "/spawn{Enter}"
    Sleep delay_warp_goto
    Send "{Ctrl down}Q"
}

^!z::
{
    Send "T"
    Sleep delay_text_open
    Send "/warp{Enter}"
    Sleep delay_warp_open
    Click mouse_x, mouse_y
    Sleep delay_warp_close
    Send "{Esc}"
    Sleep delay_warp_goto
    Send "{Ctrl down}Q"
}

^!x::
{
    global mouse_x
    global mouse_y

    MouseGetPos &mouse_x, &mouse_y
    MsgBox "Survival position set: " mouse_x ", " mouse_y
}

^!j::
{
    global mouse_x
    global mouse_y

    MsgBox "Current set position: " mouse_x "," mouse_y
}