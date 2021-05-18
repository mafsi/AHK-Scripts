#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force ; Run only a single instance

^r::Reload
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
:*:dp::dramatis personae

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
:*:pf::Pfister
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#F2::  ; Launch You Tube Download Gui
Run, "C:\Program Files (x86)\Youtube-DLG\youtube-dl-gui.exe"
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_class ConsoleWindowClass
:*:ytplv::youtube-dl.exe -i -f mp4 --write-sub --sub-lang en --yes-playlist ''
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; YouTube Audio
; #IfWinActive, ahk_class ConsoleWindowClass
:*:yta::youtube-dl.exe --extract-audio --audio-format mp3 --audio-quality 0 ''
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Inserare referință
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
:*:btt::
Send,
(
---

{*}{*}Cuvinte cheie{*}{*}: `

{#}{#} Vezi și:

- `

{#}{#} Referințe`
`

)
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Obsidian
#IfWinActive, ahk_exe Obsidian.exe
!h::  ; ALT+H Highlight
Send,^c
ClipWait
Send, ==^v
Return
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Obsidian
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
$^l:: ; Internal link CTRL+L
Send,^c
ClipWait
Send,[[^v]]
Return
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TO DO LIST - press Alt+G
!g::
send - [ ] `
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^+t::  ; Ctrl+Shif+t ; Translate clipboard
{
 Send, ^c
 Sleep 50
 Run, https://translate.google.ro/#view=home&op=translate&sl=auto&tl=ro&text=%clipboard%
 Return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Duckgo Search highlighted text
^+s::  ; CTRL+SHIFT+S
{
 Send, ^c
 Sleep 50
 Run, https://duckduckgo.com/?t=ffab&q=%clipboard%
 Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ghilimele franțuzești
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:*:<<::«
:*:>>::»
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Obsidian
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
^k::   ;CTRL+K
Send, [[{Left}{Space}{Left}|{Left}{Space}{Left}

