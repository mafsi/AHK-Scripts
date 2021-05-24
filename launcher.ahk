    #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;========================================================================
; Start script for editor app
;========================================================================
#If WinActive("ahk_exe notepad++.exe") || WinActive("ahk_exe Code.exe")
{
    Run, KeyboardOnScreen.ahk
    Return
}
Else
{
    WinClose, KeyboardOnScreen.ahk
    Return
}
Return
#If
