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

; Windows terminal
CapsLock & w::Run wt.exe

;================================================================================================
;  Vim Mode.
;================================================================================================
VimMode := False

; Caps J to enter vim mode
CapsLock & j::VimMode := True

#If %VimMode%
; I to exit vim mode
i::VimMode := False

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
return
+o::
  Send {Home}{Enter}{Up}
  VimMode := False
return

; ctrl d/w for scroll down/up
^u::Send {WheelUp 5}
^d::Send {WheelDown 5}

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
#If

