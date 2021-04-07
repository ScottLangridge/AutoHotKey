#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                     ; Enable warnings to;; assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %working_dir%  ; Ensures a consistent starting directory.

;================================================================================================
; Libraries
;================================================================================================
#Include ..\..\Lib\VA.ahk

;================================================================================================
; Imports
;================================================================================================
#Include Private_Vars.ahk
#Include General_Hotstrings.ahk ; Note: General_Hotstrings must be imported before any Return statements for the Hotstring definition to work properly.

#Include CapsLock_Scripts.ahk
#Include Git_Bash.ahk

;================================================================================================
; One Off Scripts
;================================================================================================
^.::
InputBox, input, Script Launcher, One-off script name:, no, 250, 100
Run, % "..\OneOffScripts\" . input . ".ahk"