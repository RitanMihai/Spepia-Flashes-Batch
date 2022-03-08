START magnify

CALL :OpenNyanCat

:loop
::CALL :SwitchBetweenWindows

CALL :InvertTheColor
CALL :SET

CALL :SetToNormal 
CALL :SET

goto loop

::INVERT THE COLORS
:InvertTheColor
set append=00000001
set key=HKEY_CURRENT_USER\Software\Microsoft\ScreenMagnifier
set value=Invert
set oldVal=0

EXIT /B 0


::SET TO NORMAL
:SetToNormal
set append=00000000
set key=HKEY_CURRENT_USER\Software\Microsoft\ScreenMagnifier
set value=Invert
set oldVal=0

EXIT /B 0

:SET

for /F "skip=2 tokens=3" %%r in ('reg query %key% /v %value%') do set 
oldVal=%%r
echo previous=%oldVal%
set newVal=%oldVal%%append% 
reg add %key% /v %value% /d %newVal% /f /t REG_DWORD

EXIT /B 0 

:OpenNyanCat
START chrome https://www.youtube.com/watch?v=QH2-TGUlwu4&t=6s
EXIT /B 0

:SwitchBetweenWindows
EXIT /B 0

pause