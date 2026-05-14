; Only in Chrome
#IfWinActive ahk_exe chrome.exe

; URL Hotstrings - General
::webmail::https://outlook.office.com/mail/inbox/

; URL Hotstrings - Arr
::arrjellyseerr::http://homeserver:5055/
::arrjellyfin::http://homeserver:8096/
::arrjelly::http://homeserver:8096/
::arrqbittorrent::http://homeserver:8085/
::arrradarr::http://homeserver:7878/
::arrsonarr::http://homeserver:8989/
::arrlidarr::http://homeserver:8686/
::arrreadarr::http://homeserver:8787/
::arrreadarraudio::http://homeserver:8788/
::arrprowlarr::http://homeserver:9696/
::arrbazarr::http://homeserver:6767/

; URL Hotstrings - VPI
::vpilocal::localhost:3000
::vpiexperimental::https://vpi-experimental.alphavpi.com/
::vpistable::https://vpi-stable.alphavpi.com/login
::jiravpi::https://alphaproc.atlassian.net/jira/software/c/projects/VPID/boards/3?quickFilter=5
::jirass::https://alphaproc.atlassian.net/jira/software/c/projects/VSSD/boards/5?quickFilter=7
::bbvpi::https://bitbucket.org/alphaprocesscontrol/vpi/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::bbss::https://bitbucket.org/de-rossi-consulting/vpi-soft-sensors/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::bbml::https://bitbucket.org/de-rossi-consulting/ml-service/pull-requests/?state=OPEN&author=%7Bb67d958a-ef80-4314-89c2-6d95d5ff28ed%7D
::figvpi::https://www.figma.com/file/wNOjsiEgjP3RE78iVLzmMT/VPI-Core%3A-Prototype?node-id=478-53193&t=GrL8bseR8rrHpkma-0
::figss::https://www.figma.com/file/UFXughqZ7A5XLn2CP3SaJi/VPI-Soft-Sensors%3A-Prototype?node-id=5107-173332
::confvpi::https://alphaproc.atlassian.net/wiki/spaces/DSN/overview
::confss::https://alphaproc.atlassian.net/wiki/spaces/VSSDKB/overview

; URL Hotstrings - Siemens
::jiradx::https://dev.azure.com/SHS-IT-DCE-CRM/WB%20DXCon/_sprints/taskboard/WB%20DXCon%20Team/WB%20DXCon
::bbdx::https://code.siemens.com/CRM-GDC-Healthineers/dxcon/-/merge_requests
::bbwdx::https://code.siemens.com/CRM-GDC-Healthineers/wbdxcon/-/merge_requests
::figdx::https://xd.adobe.com/view/ea75d8e5-bb68-444a-bca4-0d9c569837b8-bf26/grid
::siejs::https://dxcon-uat3.hcvpc.io/dxqb/
::siejsus::https://dxcon-uat3.hcvpc.io/dxqb/?quoteId=1422c00b-9640-4e6d-8e5d-a233b9da4a3f&country=US
::siejsde::https://dxcon-uat3.hcvpc.io/dxqb/?quoteId=b40be0c3-c9b6-4140-a2eb-ec577c783991&country=DE
::siejsnl::https://dxcon-uat3.hcvpc.io/dxqb/?quoteId=7d73b609-55f2-43bf-959b-8148df9925ec&country=NL
::sieus::http://localhost:4205/?quoteId=1422c00b-9640-4e6d-8e5d-a233b9da4a3f&country=US
::sieus2::http://localhost:4205/?quoteId=1cf3ab5c-ad94-4b43-957a-ce9106259ed8&country=US
::sieus3::http://localhost:4205/?quoteId=687f274a-b279-4834-a5db-47bd7ccbc1cb&country=US
;::siede::http://localhost:4205/?quoteId=b40be0c3-c9b6-4140-a2eb-ec577c783991&country=DE - This is the old siede before the switch to cqp3
::siede::http://localhost:4205/?quoteId=9586be1b-58cd-49a4-a71e-d8a444124c22&country=DE
::sienl::http://localhost:4205/?quoteId=7d73b609-55f2-43bf-959b-8148df9925ec&country=NL
::siesl::http://localhost:4205/?quoteId=204a021d-9b4d-4274-901d-64afeeb380a2&country=US
::sievn::http://localhost:4205/?quoteId=ae70b1e8-b577-4b18-8269-6948f043925b&country=VN
::siesluat::https://dxcon-uat.hcvpc.io/wbdxcon/?quoteId=204a021d-9b4d-4274-901d-64afeeb380a2&country=US
::siede::https://dxcon-uat.hcvpc.io/?quoteId=9586be1b-58cd-49a4-a71e-d8a444124c22&country=DE
::siedeuat::https://dxcon-uat.hcvpc.io/wbdxcon/?quoteId=9586be1b-58cd-49a4-a71e-d8a444124c22&country=DE
::siesl2::http://localhost:4205/?quoteId=82242f0b-42e8-499d-9427-f9b65dec6ef1&country=US
::sieod2::http://localhost:4205/?quoteId=bd74b3e0-e368-4bab-b728-97a72ff2f536&country=US
::sieod::http://localhost:4205/?quoteId=96f4480d-183f-40c8-a595-befd572036a5&country=ES
::siecookie2::https://dxcon-uat3.hcvpc.io/restadmin/server/info/user
::siecookie3::https://dxcon-uat.hcvpc.io/restadmin/server/info/user
::siecookiesandbox::https://sandbox-crm.hcvpc.io/restadmin/server/info/user
::siequote2::https://cpq262-uat.hcvpc.io/plugin/gui/index.html?tab=quotes
::siequote3::https://cpq3-uat-nam.hcvpc.io/plugin/gui/index.html?tab=quotes
::siets::https://forms.gle/vwg4cZodModpKfRQA
::sietsr::https://docs.google.com/spreadsheets/u/2/d/13t_OGnJe3vYST1MJ47Q88F8eZUsCoi6PtG_pZnU6Tvo/edit?gid=554714101{#}gid=554714101
::sieurltest::http://localhost:5000/wbdxcon/?quoteId=f9894e58-29ff-45f2-90be-425b5e6ac8dc&country=US

; Azure at tags
::@amrutha::@<Kamath B, Amrutha>
::@irena::@<Saykova, Irena (ext)>
::@syed::@<Shah, Syed>

; Stop me from accidentally writing vpiss, which leads to some... interesting results
::vpiss::Try again

#If
