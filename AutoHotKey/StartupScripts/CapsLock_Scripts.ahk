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
; Helper function for multi-stage hotkeys
;================================================================================================
WaitForSecondKey(timeout := 2) {
  Input, SecondKey, L1 T%timeout%

  ; Return empty string if timeout or escape
  If (ErrorLevel = 2 || ErrorLevel = 1) {
    Return ""
  }

  ; Return lowercase version of captured key
  StringLower, SecondKey, SecondKey
  Return SecondKey
}


;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
; Switch open windows between "M"onitors.
;CapsLock & m::
;while (GetKeyState("CapsLock"))
;	sleep, -1
;WinGet,Windows,List
;i = %Windows%
;while (i > 0)
;{
;    i--
;    this_id := Windows%i%
;    WinGet, WinState, MinMax, ahk_id %this_id%
;    if (WinState > -1)
;    {
;        WinActivate, ahk_id %this_id%
;        Send #+{Right}
;    }
;}
;Return

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

; "Z"ed
;   - Z-"S"-"D" -> Zed - "S"iemens - "D"XCon
;   - Z-"S"-"W" -> Zed - "S"iemens - "W"BDXCon
; Based on the obsidian block below, create bindings for Zed.
; DXCON is a cmd command: 'wsl.exe -e "zed /home/scott/siemens/repos/dxcon/iDXconf/iDXconf"'
; WBDXCON is the same but /home/scott/siemens/repos/wbdxcon/dxqb
CapsLock & z::
  key := WaitForSecondKey()
  If (key = "s") {
    key := WaitForSecondKey()
    If (key = "d") {
      Run wsl.exe -e bash -c "zed /home/scott/siemens/repos/dxcon/iDXconf/iDXconf"
    }
    Else If (key = "w") {
      Run wsl.exe -e bash -c "zed /home/scott/siemens/repos/wbdxcon/dxqb"
    }
  }
  Return

; "O"bsidian
;   - O-"S" -> Obsidian - "S"cott's Vault
;   - O-"D" -> Obsidian - "D"RS Vault
CapsLock & o::
  key := WaitForSecondKey()
  If (key = "s") {
    Run obsidian://open?vault=Scott`%27s`%20Vault&file=Task`%20Board
  }
  Else If (key = "d") {
    Run obsidian://open?vault=DRS`%20Vault&file=Task`%20Board
  }
  Return

; "W"indows terminal
CapsLock & w::Run wt.exe

; sprint "B"oard
;   - B-"D" -> Board - "D"RS
;   - B-"S" -> Board - "S"iemens
;   - B-"M" -> Board - "M"entor
CapsLock & b::
  key := WaitForSecondKey()
  If (key = "d") {
    Run https://trello.com/b/M6jr9zuI/drs-bd-tasks
  }
  Else If (key = "s") {
    Run https://dev.azure.com/SHS-IT-DCE-CRM/WB`%20DXCon/_queries/query/79b32629-47c3-4e25-9ee3-6fb85b6152d7/
  }
  Else If (key = "m") {
    Run https://linear.app/performa-fitness/my-issues/assigned
  }
  Return

; ticket "I"D
CapsLock & i::
  InputBox, tid, Enter Azure ID,,,190,100 
  If (ErrorLevel = 1) {
    Return
  }
  Run chrome.exe https://dev.azure.com/SHS-IT-DCE-CRM/WB`%20DXCon/_workitems/edit/%tid%
  Return
 

; pull "R"equests
;   - R-"S" -> Requests - "S"iemens
;   - R-"M" -> Requests - "M"entor
CapsLock & r::
  key := WaitForSecondKey()
  If (key = "s") {
    Run https://dev.azure.com/SHS-IT-DCE-CRM/_git/DXCON/pullrequests?_a=mine
    Run https://dev.azure.com/SHS-IT-DCE-CRM/_git/WB`%20DXCon/pullrequests?_a=mine
  }
  Else If (key = "m") {
    Run https://github.com/De-Rossi-Consulting/fit-lab/pulls
  }
  Return

;================================================================================================
;  Vim Mode.
;================================================================================================

SetIcon(icon_path) {
  IfExist, %icon_path%
  Menu, Tray, Icon, %icon_path%
}

; Caps J to enter vim mode
;CapsLock & j::
;  VimMode := True
;  SetIcon("..\assets\normal.png")
;return

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


;================================================================================================
;  Legacy
;================================================================================================

; "R"eview
/* CapsLock & r:: */
/*   InputBox, Vpid, Enter VPID,,,190,100 */ 
/*   If (ErrorLevel = 1) { */
/*     Return */
/*   } */

/*   Run chrome.exe "https://alphaproc.atlassian.net/browse/VPID-%Vpid%" " --new-window " */
/*   Sleep 100 */
/*   Run https://bitbucket.org/alphaprocesscontrol/vpi/pull-requests/?state=OPEN&query=%Vpid% */
/*   Sleep 100 */
/*   Run https://bitbucket.org/de-rossi-consulting/vpi-soft-sensors/pull-requests/?state=OPEN&query=%Vpid% */
/*   Sleep 100 */
/*   Run https://bitbucket.org/de-rossi-consulting/ml-service/pull-requests/?state=OPEN&query=%Vpid% */
/*   Sleep 100 */
/*   Run https://crucible.alphavpi.com/cru/?filter=custom&title=%Vpid%&project=&author=&moderator=&creator=&reviewer=&complete=any&reviewType=any&orRoles=true&state=Approval&state=Review&state=Summarize&state=Unknown&state=Open+Snippet */

/* Return */
