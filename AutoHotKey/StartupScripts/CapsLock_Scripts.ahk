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

; "W"indows terminal
CapsLock & w::Run wt.exe

; j"I"ra
CapsLock & i:: Run https://alphaproc.atlassian.net/jira/software/c/projects/VPID/boards/3?quickFilter=5

; "B"itbucket
CapsLock & b:: Run https://bitbucket.org/alphaprocesscontrol/vpi/pull-requests/?state=OPEN&author=`%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed`%7D

; "C"rucible
CapsLock & c:: Run https://crucible.alphavpi.com/cru/?filter=custom&title=SL&project=&author=&moderator=&creator=&reviewer=&complete=any&reviewType=any&orRoles=true&state=Draft&state=Approval&state=Review&state=Summarize&state=Unknown&state=Open+Snippet

; "R"eview
CapsLock & r::
  InputBox, Vpid, Enter VPID,,,190,100 
  If (ErrorLevel = 1) {
    Return
  }

  Run chrome.exe "https://alphaproc.atlassian.net/browse/VPID-%Vpid%" " --new-window "
  Run https://bitbucket.org/alphaprocesscontrol/vpi/pull-requests/?state=OPEN&query=%Vpid%
  Run https://bitbucket.org/de-rossi-consulting/vpi-soft-sensors/pull-requests/?state=OPEN&query=%Vpid%
  Run https://bitbucket.org/de-rossi-consulting/ml-service/pull-requests/?state=OPEN&query=%Vpid%
  Run https://crucible.alphavpi.com/cru/?filter=custom&title=%Vpid%&project=&author=&moderator=&creator=&reviewer=&complete=any&reviewType=any&orRoles=true&state=Approval&state=Review&state=Summarize&state=Unknown&state=Open+Snippet

Return

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

; A to append to the end of the line
+a::
  VimMode := False
  SetIcon("..\assets\insert.png")
  Send {End}{Right}

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
  Send {End}{Home}{Enter}{Up}
  VimMode := False
  SetIcon("..\assets\normal.png")
return

$d::
  KeyWait, d, U
  KeyWait, d, D, T0.2
  If (ErrorLevel = 0)
    Send {Home}+{End}{Delete 2}
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

