    #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent
/*
Launcher for other scripts:

This is the main launcher who will trigger
other scripts according to some conditions
below

*/
GroupAdd, Editors, ahk_exe notepad++.exe
GroupAdd, Editors, ahk_exe Code.exe
GroupAdd, Editors, ahk_exe Obsidian.exe

GroupAdd, Browsers, ahk_exe chrome.exe

EditorScript := A_ScriptDir "\KeyboardOnScreen.ahk"
BrowserScript := A_ScriptDir "\IntelliSense.ahk"

EditorOpen := !WinExist("ahk_group Editors")
BrowserOpen := !WinExist("ahk_group Browsers")

Settimer, programsCheck, 6000
return

programsCheck:
  if (WinExist("ahk_group Editors") && !EditorsOpen) {
    EditorOpen := true
    Run % EditorScript
  }
  if (!WinExist("ahk_group Editors") && EditorsOpen) {
    EditorOpen := false
    WinClose % EditorScript
  }
  
  if (WinExist("ahk_group Browsers") && !BrowserOpen) {
    BrowserOpen := true
    Run % BrowserScript
  }
  if (!WinExist("ahk_group Browsers") && BrowserOpen) {
    BrowserOpen := false
    WinClose % BrowserScript
  }
return