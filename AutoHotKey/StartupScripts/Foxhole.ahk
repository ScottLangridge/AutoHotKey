; Only in Foxhole
#IfWinActive ahk_exe War-Win64-Shipping.exe

; Reference
^/:: MsgBox,
(
FOXHOLE BINDINGS

A suite of hand cramp saving tools for Foxhole. All for the low, low cost of the Bitcoin I mine on your computer in the background (not really)!

Ctrl + Left Click:%A_Tab%%A_Tab%Left Click and Hold (Auto-build/repair)
Ctrl + Shift + Left Click:%A_Tab%Spams Left Click (Auto-assemble)
Ctrl + Right Click:%A_Tab%%A_Tab%Right Click and Hold (Toggle aim/binocular)
Ctrl + Middle Click:%A_Tab%Middle Click and Hold (Auto-rotate cam)
(Press the relavent mouse button again once to cancel all of the above)

Ctrl + W : W and Hold (Auto-run)

Ctrl + A : Auto-reload and Fire Artillery (Spams 'r, click, r, click...')
(Cancelled by repeating the sequence or pressing q to leave the artillery piece)

Requests for new bindings or tweaks of existing ones welcome. Just let me know on Discord: Lazarus#9840
)

; Toggle Aim
^RButton:: Click Down Right

; Toggle Action
^LButton:: Click Down Left

; Toggle Pan
^MButton:: Click Down Middle

; Autorun
^w:: Send {w down}

; Breaking stops autorun
~s::
  Send {w up}
return

; Autofire Artillery
#MaxThreadsPerHotkey 3
^a::
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

; Stop Firing When Leaving Artillery Piece
~q::
  if Firing {
    Firing := false
  }
return

; Autoclick
#MaxThreadsPerHotkey 3
^+LButton::
  #MaxThreadsPerHotkey 1
  if Clicking{
    Clicking:= false
    return
  }

  Clicking:= true
  Loop {
    Click LButton
    Sleep 250

    if not Clicking
      break
  }

  Clicking:= false
return

; Stop Autoclicking on Click
~LButton::
  if Clicking{
    Clicking:= false
  }
return

#If

