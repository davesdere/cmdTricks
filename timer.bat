@echo off
:: David Cote 2018 - Because Windows 10 timer sucks
:Start
title timer
color 0A
echo Type in an amount of time (Seconds)
set /p time=

color 19

:loop
cls
ping localhost -n 2 >nul
set /a time=%time%-1
echo %time%
if %time% EQU 0 goto Timesup
goto loop

:Timesup
title Timer is done!
color C9
rundll32 user32.dll,MessageBeep
ping localhost -n 2 >nul
ping localhost -n 2 >nul
cls
echo The Timer is Done !
rundll32.exe cmdext.dll,MessageBeepStub
MSG * /v "Timer is done!"
pause
cls
echo Ciao!
pause
goto Exit

:Exit
Exit
goto Exit
