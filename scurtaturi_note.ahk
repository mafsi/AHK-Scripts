#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force ; Run only a single instance

^r::Reload
<<<<<<< Updated upstream
;
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
:*:dp::dramatis personae
;
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
:*:pf::Pfister
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;You Tube Download Gui
#F2::
Run, "C:\Program Files (x86)\Youtube-DLG\youtube-dl-gui.exe"
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; YouTube Video Playlist
;#IfWinActive, ahk_class ConsoleWindowClass
=======
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
:*:dp::dramatis personae
#If
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
:*:pf::Pfister
#If
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#F2::  ; Launch You Tube Download Gui
Run, "C:\Program Files (x86)\Youtube-DLG\youtube-dl-gui.exe"
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_exe powershell.exe
>>>>>>> Stashed changes
:*:ytplv::youtube-dl.exe -i -f mp4 --write-sub --sub-lang en --yes-playlist ''
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; YouTube Audio
; #IfWinActive, ahk_class ConsoleWindowClass
:*:yta::youtube-dl.exe --extract-audio --audio-format mp3 --audio-quality 0 ''
Return


; Inserare referință
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
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
<<<<<<< Updated upstream
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
=======
#If
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
>>>>>>> Stashed changes
; Obsidian
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
!h::  ; ALT+H Highlight
Send,^c
ClipWait
Send, ==^v
Return
<<<<<<< Updated upstream
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
=======
#If
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
>>>>>>> Stashed changes
; Obsidian
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
$^l:: ; Internal link CTRL+L
Send,^c
ClipWait
Send,[[^v]]
Return
<<<<<<< Updated upstream
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
=======
#If
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
>>>>>>> Stashed changes
; TO DO LIST - press Alt+G
!g::
send - [ ] `
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

;;;;;;;;;;;;;;;;;;;;;;;
; Ghilimele franțuzești
;;;;;;;;;;;;;;;;;;;;;;;
:*:<<::«
:*:>>::»

; Obsidian
<<<<<<< Updated upstream
#IfWinActive, ahk_exe Obsidian.exe
#IfWinActive, ahk_class Chrome_WidgetWin_1
^k::   ;CTRL+K

=======
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
^k::   ;CTRL+K internal link personalised
>>>>>>> Stashed changes
Send, [[{Left}{Space}{Left}|{Left}{Space}{Left}
#If

; remapping keyboard
#If WinActive ("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
!ă::[ ; Make key „ă” send „[”, only in Obsidian, Vs Code and Notepad++
!î::] ; Make key „î” send  „]”, only in Obsidian, Vs Code and Notepad++
+!ă::{ ; Make key „ă” send „{”, only in Obsidian, Vs Code and Notepad++
+!î::} ; Make key „î” send  „}”, only in Obsidian, Vs Code and Notepad++
#If
