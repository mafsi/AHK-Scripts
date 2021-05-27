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

Glob(list, "C:\temp\*")
Glob(list, "C:\temp\*.*")
Glob(list, "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\*")
Glob(list, "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\*.*")
Glob(list, "C:\Users\*\AppData\Local\Temp\*")
Glob(list, "C:\Users\*\AppData\Local\Temp\*.*")
Glob(list, "C:\Documents and Settings\*\Cookies\*")
Glob(list, "C:\Documents and Settings\*\Cookies\*.*")
Glob(list, "C:\Documents and Settings\*\Local Settings\Temp\*")
Glob(list, "C:\Documents and Settings\*\Local Settings\Temp\*.*")
Glob(list, "C:\Documents and Settings\*\Local Settings\Temporary Internet Files\*")
Glob(list, "C:\Documents and Settings\*\Local Settings\Temporary Internet Files\*.*")
Glob(list, "C:\Documents and Settings\*\Local Settings\History\*")
Glob(list, "C:\Documents and Settings\*\Local Settings\History\*.*")
Glob(list, "C:\Users\*\AppData\Local\Mozilla\Firefox\Profiles\l69utceo.default-release\cache2\entries\*")

Loop, Parse, list, `n 
{
FileGetAttrib, FolderOrFile, %A_LoopField%
IfInString, FolderOrFile, D
	FileRemoveDir, %A_LoopField%, 1
else
	FileDelete, %A_LoopField%
}

MsgBox, Clean-up complete.

;Uncomment (Remove the semi-colon) this next line if you want to see what couldn't be deleted.
;MsgBox %list%

Glob(ByRef list, Pattern, IncludeDirs=1)
{
    if (i:=RegExMatch(Pattern,"[*?]")) && (i:=InStr(Pattern,"\",1,i+1))
        Loop, % SubStr(Pattern, 1, i-1), 2
            Glob(list, A_LoopFileLongPath . SubStr(Pattern,i), IncludeDirs)
    else
        Loop, %Pattern%, %IncludeDirs%
            list .= (list="" ? "" : "`n") . A_LoopFileLongPath
}