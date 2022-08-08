; Only in git bash
#IfWinActive ahk_exe War-Win64-Shipping.exe

; Toggle Aim
^RButton:: Click Down Right

; Toggle Action
^LButton:: Click Down Left

; Toggle Pan
^MButton:: Click Down Middle

; Autorun
^w:: Send {w down}

; Autofire Artillery
#MaxThreadsPerHotkey 3
^space::
  #MaxThreadsPerHotkey 1
  if Firing {
    Firing := false
    return
  }

  Firing := true
  Loop {
    Send r
    Sleep 250
    Click LButton
    Sleep 250

    if not Firing
      break
  }

  Firing := false
return

#If

