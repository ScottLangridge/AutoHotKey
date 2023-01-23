;================================================================================================
; Temporary Hot Strings
;================================================================================================
; Temporary Hot Strings are meant to be created "on the fly" as part of whatever workflow you are 
; currently using.
;
; They are git ignored, so local to the machine they are created on and should be disposable.
; i.e. They could be deleted at any time and it wouldn't really be an issue.
;
; Reference Example:
; ::btw::by the way
;
; Full Docs:
; https://www.autohotkey.com/docs/Hotstrings.htm

::eqn::MIN(FC301.OP, FC302.OP, DELAY(FC301.OP, 120), DELAY(FC301.OP, 180))
^[::
send `:w {return}
sleep 100
send `:so `% {return}
return