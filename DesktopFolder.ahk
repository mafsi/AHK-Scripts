; AHK script created by Lateralus138
; Create desktop folders with a hotkey
; Key Control+Shift+f (^+f)

; Tray icon function (just for fun),
; provide resource library name and
; icon number and tray message.
TrayIcon(ResNam, ResNum, TrayMsg )
	{
		Menu, Tray, Icon, %ResNam%, %ResNum%
		Menu, TRAY, Tip, %TrayMsg%
	}


; Tooltip w/timer function, provide
; text and time.
tttimer(tttext, tttime)
	{
		ToolTip, %tttext%
		Sleep, %tttime%
		ToolTip
	}

; Current users desktop location.
DeskDir := USERPROFILE . "\Desktop\"

; Initially call main tray icon
Gosub, TrayIconSub

; Start hotkey, main program funtion.

; Change hotkey in the line below.
+!f::
TrayIcon("imageres.dll", 108, "Name your desktop folder.")
InputBox, FolderName, Desktop Folder Creator, Name your desktop folder`:,,300, 120
If ! FolderName
	{
		TrayIcon("imageres.dll", 80, "Folder name not set.")
		tttimer("Folder name not set.", 6000)
		Gosub, TrayIconSub
		Return
	}
NewDir := DeskDir . FolderName
FileCreateDir, %NewDir%
If ! NewDir
	{
		TrayIcon("imageres.dll", 80, "Bad news!")
		tttimer("Something went wrong, Folder`:`n" """" . NewDir . """" "`ndoes not exist.",10000 )
		Gosub, TrayIconSub
		Return
	}
TrayIcon("imageres.dll", 77, "Folder created!")
tttimer("Folder`:`n" """" . NewDir . """" "`ncreated successfully!.",6000)
Gosub, TrayIconSub
Return

; Resets tray icon folder icon
TrayIconSub:
TrayIcon("imageres.dll", 108, "Desktop Folder Creator")
Return
