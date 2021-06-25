#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force ; Run only a single instance
Menu, Tray, Icon, script.ico
Menu, Tray, Tip, Main Script AHK
;=============================================================================================
; Put active App on Top (WIN+A)
;=============================================================================================
#a::
WinSet, AlwaysOnTop, , A
Return
;=============================================================================================
; Reload Script
;=============================================================================================
^r::Reload
;=============================================================================================
; Send „dpdv”
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
::dpdv::din punct de vedere
Return
#If
;=============================================================================================
; Send „aî” == astfel încît
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
::aî::astfel încît
Return
#If
;=============================================================================================
; Send „dramatis personae”
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
::dp::dramatis personae
Return
#If
;=============================================================================================
; Send „Pfister”
;=============================================================================================
#If WinActive("ahk_exe notepad++.exe") || WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
:*:pf::Pfister
#If
;=============================================================================================
; Launch You Tube Download Gui (WIN+F2)
;=============================================================================================
#F2::
Run, "C:\Program Files (x86)\Youtube-DLG\youtube-dl-gui.exe"
Return
;=============================================================================================
; Download You Tube Video Playlist from CLI
;=============================================================================================
#If WinActive("ahk_exe powershell.exe")
:*:ytplv::youtube-dl.exe -o '%(playlist_index)s.%(title)s.%(ext)s' -i -f mp4 --write-sub --sub-lang en --yes-playlist ''
Return
;=============================================================================================
; Tesseract-OCR
;=============================================================================================
#If WinActive("ahk_exe powershell.exe")
:*:tess::tesseract .\SELECTEDFILES.txt Book -l eng pdf
Return
;=============================================================================================
; Download You Tube Audio from CLI
;=============================================================================================
#If WinActive("ahk_exe powershell.exe")
:*:yta::youtube-dl.exe --extract-audio --audio-format flac --audio-quality 0 ''
Return
;=============================================================================================
; Inserare referință în Obsidian și VS Code
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
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
#If
;=============================================================================================
; Evidențiere cuvînt în Obsidian și VS Code (ALT+H)
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
!h::
Send,^c
ClipWait
Send, ==^v==
Return
#If
;=============================================================================================
; Inserare link intern în Obsidian și VS Code (CTRL+L)
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
^l::
Send,^c
ClipWait
Send, [[^v
Return
#If
;=============================================================================================
; Inserare listă TODO (ALT+G)
;=============================================================================================
!g::
send - [ ] `
return
;=============================================================================================
; Translate clipboard (CTRL+SHIFT+T)
;=============================================================================================
^+t::
{
 Send, ^c
 Sleep 50
 Run, https://translate.google.ro/#view=home&op=translate&sl=auto&tl=ro&text=%clipboard%
 Return
}
;=============================================================================================
; Duckduckgo Search highlighted text (CTRL+SHIFT+S)
;=============================================================================================
^+s::
{
 Send, ^c
 Sleep 50
 Run, https://duckduckgo.com/?t=ffab&q=%clipboard%
 Return
}
;=============================================================================================
; French Quotes for English language
;=============================================================================================
:*:<<::«
:*:>>::»
;=============================================================================================
; Internal link personalized (LEFT ALT+K)
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe")
<!k::
Clipboard := ""
Sleep, 1
Send, ^c
ClipWait
Send, [[|%clipboard%
length := StrLen(Clipboard)+1
Send {Left %length%}
Return
#If
;=============================================================================================
; Mapare tastatură // Tastatura în română este mapată pentru a oferi acces la unele taste
; din engleză
;=============================================================================================
#If WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe Code.exe") || WinActive("ahk_exe notepad++.exe")
!ă::[ ; Make key „ALT+Ă” send „[”, only in Obsidian, Vs Code and Notepad++
!î::] ; Make key „ALT+Î” send  „]”, only in Obsidian, Vs Code and Notepad++
!+ă::{ ; Make key „ALT+SHIFT+Ă” send „{”, only in Obsidian, Vs Code and Notepad++
!+î::} ; Make key „ALT+SHIFT+Î” send  „}”, only in Obsidian, Vs Code and Notepad++
!.::> ; Make key „ALT+.” send  „>”, only in Obsidian, Vs Code and Notepad++
!,::< ; Make key „ALT+,” send  „<”, only in Obsidian, Vs Code and Notepad++
!+.::» ; Make key „ALT+SHIFT+.” send  „»”, only in Obsidian, Vs Code and Notepad++
!+,::« ; Make key „ALT+SHIFT+,” send  „«”, only in Obsidian, Vs Code and Notepad++
!â::\ ; Make key „ALT+Â” send „\” only in Obsidian, Vs Code and Notepad++
!+â::| ; Make keu „ALT+SHIFT+Â” send | only in Obsidian, Vs Code and Notepad++
:*:„::„”{Left} ; Send „” when pressing just „
#If
;=============================================================================================
; Mute / UnMute Microphone + Toggle
;=============================================================================================
; Mute
;F9::
;    Run nircmd.exe mutesysvolume 1 microphone
;    Return
;
; Unmute
;F10::
;    Run nircmd.exe mutesysvolume 0 microphone
;    Return
;
; Toggle
F10::
  on := !on
  If on
  {
    Run nircmd.exe mutesysvolume 1 default_record
    MsgBox, 0, STATUS MICROFON, Microfonul este oprit!, 3
  }
Else
  {
  Run nircmd.exe mutesysvolume 0 default_record
   MsgBox, 0, STATUS MICROFON, Microfonul este pornit!, 3
  }
Return
;=============================================================================================
; Insert Current Date / Time only in Vs Code (ALT+D)
;=============================================================================================
#If WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe notepad++.exe")
!d::
FormatTime, Data,, dddd, d MMMM yyyy / HH:mm:ss
Send, %Data%
Return
#If
;=============================================================================================
; Change between Languages in OS (Right CTRL+/)
;=============================================================================================
#UseHook On
>^/::
Send, #{Space}
Return
;=============================================================================================
; Empty Recycle Bin (WIN + Delete)
;=============================================================================================
#Del::FileRecycleEmpty
Return
;=============================================================================================
; Dopamine App Music (Right ALT + L)
;=============================================================================================
RAlt & l::
Run, C:\Program Files (x86)\Dopamine\Dopamine.exe
Return
;=============================================================================================
; Volume & Music control Play/Pause music/Next/Prev
;=============================================================================================
; rAlt + p - Play/Stop Music
RAlt & p::Send {Media_Play_Pause}

; LEFT ALT+ ← (Left arrow) - Previous track
<!Left::Send {Media_Prev}

; LEFT ALT + → (Right arrow) - Next track
<!Right::Send {Media_Next}

; F8 - Volume down at 20%
F8::SoundSet 20

; F9 - Volume up at 50%
F9::SoundSet 50
;=============================================================================================
; ScreenShot (PrintScreen)
;=============================================================================================
PrintScreen::Send #+s