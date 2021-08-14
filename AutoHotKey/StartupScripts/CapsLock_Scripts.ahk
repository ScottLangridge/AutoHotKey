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

; Switch "O"utput device between speakers and headphones.
CapsLock & o::
	device := VA_GetDevice("playback")
        deviceName := VA_GetDeviceName(device)
        if (deviceName = "Speakers (Realtek High Definition Audio)")
	{
		Run ..\..\Utilities\NirCmd\nircmd setdefaultsounddevice "DELL U2417H - Left"
	}
	else 
	{
		Run ..\..\Utilities\NirCmd\nircmd setdefaultsounddevice "Speakers"
	}
Return

; Run "T"inyTask.
CapsLock & t::Run ..\..\Utilities\TinyTask\TinyTaskPortable\TinyTaskPortable.exe


; "P"rintscreen
CapsLock & p::Send {PrintScreen}