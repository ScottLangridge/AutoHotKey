; Only in windows terminal
#IfWinActive ahk_exe WindowsTerminal.exe

; Sudo this
^s:: Send {home}sudo {end}

; Sudo last
+^s:: Send {up}{home}sudo {end}

#If
