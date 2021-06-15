#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force

Menu, Tray, Icon, test.ico
Menu, Tray, Tip, TEST AHK
/*
This is just a playground
*/

/*
^a::
If (GetKeyState("s"))
   Send, #{Space}
*/

/*
Succesiunea corecta a secventei este urmatoarea: CTRL+a+l
vezi: https://www.autohotkey.com/docs/Hotkeys.htm#Context
Apasam CTRL apoi se asteapta a + l pentru a trimite CTRL+l
*/
/*
; If the keys are swapped, Ctrl must be pressed first (use one at a time):
#if GetKeyState("a","l")
Ctrl & l::
Send, #{Space}
return

#if GetKeyState("y","t")
Ctrl & t::
MsgBox, 0, testing!
return
*/


; ALT+ ← (Left arrow) - Previous track
<!Left::Send {Media_Prev}

; ALT + → (Right arrow) - Next track
<!Right::Send {Media_Next}

; ALT + DOWN - Volume down at 20%
<!Down::SoundSet 20

; ALT + UP - Volume up at 50%
<!Up::SoundSet 50

; ALT+ M - Mute Volume
;!m::Send {VOLUME_MUTE}
