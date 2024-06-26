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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Auto Snippet Nota
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!c::		 	 ; CTRL+ALT+C - define shortcut here 
	Clipboard := ; Clear the clipboard
	send ^c		 ; COPY selection
	ClipWait	 ; wait for the clipboard to contain data.
	gosub AutoSnipp
return

^!x::			 ; CTRL+ALT+X define shortcut here. 
	Clipboard := ; Clear the clipboard
	send ^x		 ; CUT selection
	ClipWait	 ; wait for the clipboard to contain data.
	gosub AutoSnipp
return

AutoSnipp:
	; ===== retrieve windows title ======
	WinGetActiveTitle, Title	
	; windows title beautification - remove the ending part with the program name e.g. - Firefox
	StringGetPos,pos,Title,%A_space%-,R
	if (pos != -1)
		Title := SubStr(Title,1,pos)

	; ===== create folder vault\snippets\yyyyMM ======
	Snipdir := "d:\GDrive\DEZVOLTARE\Akademia\NoteLiteratura\_fragmente" ; !!! change this to your own folder !!!
	FormatTime, thismonth,, dd-MMMM-yyyy
	FileID = xx_%A_Now%-%A_Msec%_%Title%
	IfNotExist, %Snipdir%\%thismonth%\
		FileCreateDir, %Snipdir%\%thismonth%\

	; ===== create snippet =====
	BadChars := "+=!@#$%^&*?()|/\,><};{"	; list invalid characters
	;loop trough all the characters that need to be replaced in filename
	Loop, Parse, BadChars
		{
			;if a bad character is found, remove it
			StringReplace, FileID, FileID, %A_LoopField%,, All
		}
	
	; ====== convert to keep accents - ONLY works with ahk ANSI !!! =====
	TRANSFORM, ClipUTF, unicode
	Clipboard = %ClipUTF%
	; ====== create a new .md file with clipboard contents =======
	FileAppend, %Clipboard%, %Snipdir%\%thismonth%\%FileID%.md	
	ClipWait
	
	; ====== create the transclusion link, put it in clipboard =======
	Clipboard = ![[%FileID%]]	
	MsgBox saved selection in \snippets\%thismonth%\ as`n%FileID%.md`nTransclusion link ready to be pasted ; remove this line for faster operation
return
;;;;;;;;;;;;;;;;;;;;;;;
; Ghilimele franțuzești
;;;;;;;;;;;;;;;;;;;;;;;
::<<::«
::>>::»