Name "DetoursInstaller"
OutFile "DetInstaller.exe"
!include "MUI.nsh"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "MIT.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
!define SND_ASYNCLOOP 0x0009
BrandingText "DetoursInstaller"
;--------------------------------
; Required for big packages only
 
ReserveFile "${NSISDIR}\Plugins\x86-unicode\System.dll"

Function .onInit

  InitPluginsDir
  File /oname=$PLUGINSDIR\AstelLedaZeroIchi.mp3 "AstelLedaZeroIchi.mp3"

  StrCpy $0 "$PLUGINSDIR\AstelLedaZeroIchi.mp3"  ; location of the wav file
  System::Call 'winmm::mciSendStringW(t "play AstelLedaZeroIchi.mp3 repeat", i 0, i 0, i 0) i .r1'
FunctionEnd

Section 01
    SetOutPath "C:\CppLib\Detours"
    File /nonfatal /r "F:\Detours\*.*"
SectionEnd