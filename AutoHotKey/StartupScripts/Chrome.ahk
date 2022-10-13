; Only in Chrome
#IfWinActive ahk_exe chrome.exe

; URL Hotstrings
::jiravpi::https://alphaproc.atlassian.net/jira/software/c/projects/VPID/boards/3?quickFilter=5
::jirass::https://alphaproc.atlassian.net/jira/software/c/projects/VSSD/boards/5?quickFilter=7
::bbvpi::https://bitbucket.org/alphaprocesscontrol/vpi/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::bbss::https://bitbucket.org/de-rossi-consulting/vpi-soft-sensors/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::bbml::https://bitbucket.org/de-rossi-consulting/ml-service/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::confvpi::https://alphaproc.atlassian.net/wiki/spaces/DSN/overview
::confss::https://alphaproc.atlassian.net/wiki/spaces/VSSDKB/overview
::vpilocal::localhost:3000
::vpiexperimental::https://vpi-experimental.alphavpi.com/
::vpistable::https://vpi-stable.alphavpi.com/login
::webmail::https://outlook.office.com/mail/inbox/

; Stop me from accidentally writing vpiss, which leads to some... interesting results
::vpiss::Try again

#If
