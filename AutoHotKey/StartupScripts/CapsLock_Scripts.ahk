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
CapsLock & 1::Run wt.exe

; HJKL for arrow keys
CapsLock & h::Send {Left}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & l::Send {Right}

; W and B for vim style word skipping
CapsLock & b::Send ^{Left}
CapsLock & w::Send ^{Right}

