; Volcania Network /warp duper v1.2.
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
mouse_x1 := 0
mouse_x2 := 0
mouse_y1 := 0
mouse_y2 := 0

hIcon := LoadPicture("fart.ico", "Icon1 w32 h32", &imgtype)
main_gui := Gui(,"Volcania Net. Duper v1.2")

SendMessage(0x0080, 0, hIcon, main_gui)
SendMessage(0x0080, 1, hIcon, main_gui)

text_welcome := main_gui.Add("Text","w300 h30","Fartfania Duper v1.2 by PK2_Stimpy")
text_welcome.SetFont("s14",)
main_gui.Add("Text",,"")
text_config := main_gui.Add("Text","w200 h20","DELAY CONFIGURATION")
text_config.SetFont("s10",)

main_gui.Add("Text",,"Open Text:")
main_gui.AddEdit()
dtoc := main_gui.AddUpDown("vDelayTextOpen Range0-5000", delay_text_open)

main_gui.Add("Text",,"Warp Open:")
main_gui.AddEdit()
dwoc := main_gui.AddUpDown("vDelayWarpOpen Range0-5000", delay_warp_open)

main_gui.Add("Text",,"Warp Close:")
main_gui.AddEdit()
dwcc := main_gui.AddUpDown("vDelayWarpClose Range0-5000", delay_warp_close)

main_gui.Add("Text",,"Warp Goto:")
main_gui.AddEdit()
dwgc := main_gui.AddUpDown("vDelayWarpGoto Range0-5000", delay_warp_goto)

UpdateSettings(porn, sex)
{
    global delay_text_open
    global delay_warp_open
    global delay_warp_close
    global delay_warp_goto

    delay_text_open := dtoc.Value
    delay_warp_open := dwoc.Value
    delay_warp_close := dwcc.Value
    delay_warp_goto := dwgc.Value
}

main_gui_button_upd := main_gui.AddButton("Default w140", "Update Settings")
main_gui_button_upd.OnEvent("Click", UpdateSettings)

main_gui.Add("Text",,)

text_keys := main_gui.Add("Text","w200 h20","KEYBOARD COMBINATIONS")
text_keys.SetFont("s10",)

main_gui.Add("Text",,"Ctrl+Alt+C to configure goto warp click position")
main_gui.Add("Text",,"Ctrl+Alt+V to configure back warp click position")
main_gui.Add("Text",,"Ctrl+Alt+Z to run goto warp dupe")
main_gui.Add("Text",,"Ctrl+Alt+X to run back warp dupe")
main_gui.Add("Text",,"Ctrl+Alt+G to run /spawn dupe")
main_gui.Add("Text",,"Ctrl+Alt+L variables test")
main_gui.Add("Text",,)

main_gui.Show

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
    Click mouse_x1, mouse_y1
    Sleep delay_warp_close
    Send "{Esc}"
    Sleep delay_warp_goto
    Send "{Ctrl down}Q"
}

^!x::
{
    Send "T"
    Sleep delay_text_open
    Send "/warp{Enter}"
    Sleep delay_warp_open
    Click mouse_x2, mouse_y2
    Sleep delay_warp_close
    Send "{Esc}"
    Sleep delay_warp_goto
    Send "{Ctrl down}Q"
}

^!c::
{
    global mouse_x1
    global mouse_y1

    MouseGetPos &mouse_x1, &mouse_y1
    MsgBox "Goto position set: " mouse_x1 ", " mouse_y1
}

^!v::
{
    global mouse_x2
    global mouse_y2

    MouseGetPos &mouse_x2, &mouse_y2
    MsgBox "Back position set: " mouse_x2 ", " mouse_y2
}

^!l::
{
    global delay_text_open
    global delay_warp_open
    global delay_warp_close
    global delay_warp_goto
    MsgBox "TEST! " delay_text_open "," delay_warp_open "," delay_warp_close "," delay_warp_goto
}