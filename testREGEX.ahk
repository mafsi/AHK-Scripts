#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remove all LINES from the clipboard contents:
str := clipboard 
pos := 1

While (pos)
{
    str := RegExReplace(str, "^.+\K\R(?!\R)", " ", pos)
}

clipboard := str
