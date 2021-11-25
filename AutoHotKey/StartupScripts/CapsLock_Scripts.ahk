;================================================================================================
;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
;================================================================================================
; Must double tap CapsLock to toggle CapsLock mode on or off.
CapsLock::
    KeyWait, CapsLock                                                   ; Wait forever until Capslock is released.
    KeyWait, CapsLock, D T0.2                                           ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
    if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") )                 ; Is a double tap on CapsLock?
        {
        SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"  ; Toggle the state of CapsLock LED
        }
return


;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
; "G"oogle the selected text.
CapsLock & g::
    ClipSaved := % clipboardAll
    clipboard := ""
    Send, ^c
    ClipWait 0
    If ErrorLevel
        {
        MsgBox, No Text Selected!
        Return
        }
    Run, http://www.google.com/search?q=%clipboard%
    clipboard = % ClipSaved
Return

; Switch open windows between "M"onitors.
CapsLock & m::
while (GetKeyState("CapsLock"))
	sleep, -1
WinGet,Windows,List
i = %Windows%
while (i > 0)
{
    i--
    this_id := Windows%i%
    WinGet, WinState, MinMax, ahk_id %this_id%
    if (WinState > -1)
    {
        WinActivate, ahk_id %this_id%
        Send #+{Right}
    }
}
Return

; Run "T"inyTask.
CapsLock & t::Run ..\..\Utilities\TinyTask\TinyTaskPortable\TinyTaskPortable.exe

; "P"rintscreen
CapsLock & p::Send {PrintScreen}

; Left/[ for Home
CapsLock & Left::Send {Home}
CapsLock & [::Send {Home}

; Right/] for End
CapsLock & Right::Send {End}
CapsLock & ]::Send {End}

;================================================================================================
;  Vim Mode.
;================================================================================================

SetIcon(icon_path) {
  IfExist, %icon_path%
  Menu, Tray, Icon, %icon_path%
}

; Caps J to enter vim mode
CapsLock & j::
  VimMode := True
  SetIcon("..\assets\normal.png")
return

#If %VimMode%
; I to exit vim mode
i::
  VimMode := False
  SetIcon("..\assets\insert.png")
return

; HJKL for arrow keys
h::Send {Left}
j::Send {Down}
k::Send {Up}
l::Send {Right}
+h::Send +{Left}
+j::Send +{Down}
+k::Send +{Up}
+l::Send +{Right}

; W and B for vim style word skipping
b::Send ^{Left}
w::Send ^{Right}
+b::Send +^{Left}
+w::Send +^{Right}

; O for start new line below current
o::
  Send {End}{Enter}
  VimMode := False
  SetIcon("..\assets\normal.png")
return
+o::
  Send {Home}{Enter}{Up}
  VimMode := False
  SetIcon("..\assets\normal.png")
return

; ctrl d/w for scroll down/up
^u::Send {PgUp}
^d::Send {PgDn}

; x for delete
x::Send {Delete}

; u for undo
u::Send ^z

; / for search
/::Send ^f

; Disable other keys
a::
c::
d::
e::
f::
g::
m::
n::
p::
q::
r::
s::
t::
v::
y::
z::
Space::
#If
