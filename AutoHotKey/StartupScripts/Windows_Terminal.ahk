; Only in windows terminal
#IfWinActive ahk_exe WindowsTerminal.exe

; Sudo this
^s:: Send {home}sudo {end}

; Sudo last
+^s:: Send {up}{home}sudo {end}

; Commit
^k:: Send git commit -m "feat/fix/chore [WIP]:"{Ctrl Down}{left}{left}{left}{left}{Ctrl Up}

; Push
^+k:: Send git push

#If
