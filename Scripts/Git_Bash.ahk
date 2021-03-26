; Only in git bash
#IfWinActive ahk_exe mintty.exe

; Commit
^k:: Send git commit -am ""{left}

; Push
^+k:: Send git push

#If

