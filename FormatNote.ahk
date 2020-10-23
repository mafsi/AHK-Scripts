#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#f::Run Firefox ; WIN+F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Inserare referință
::ref::
Send, 
(
---

{#}{#} Referință


---

{*}{*}Cuvinte cheie{*}{*}: `
)
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Obsidian
#IfWinActive, ahk_exe Obsidian.exe
^+h::  ; CTRL+SHIFT+H Highlight
Send,^c
ClipWait
Send, ==^v
Return
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Obsidian
#IfWinActive, ahk_exe Obsidian.exe
$^l:: ; Internal link CTRL+L
Send,^c
ClipWait
Send,[[^v]]
Return
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TO DO LIST - press Alt+G
!g::
send - [ ]
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^+t::  ; Ctrl+Shif+t ; Translate clipboard
{
 Send, ^c
 Sleep 50
 Run, https://translate.google.ro/#view=home&op=translate&sl=auto&tl=ro&text=%clipboard%
 Return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Duckgo Search highlighted text
^+s::  ; CTRL+SHIFT+S
{
 Send, ^c
 Sleep 50
 Run, https://duckduckgo.com/?t=ffab&q=%clipboard%
 Return
}