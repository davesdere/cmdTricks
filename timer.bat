@echo off
:: David Cote 2018 - Because Windows 10 timer sucks
echo %0% A timer because Windows 10 timer sucks
:Start
title %0%
color 0A
echo Type in an amount of time (Seconds)
set /p time=
IF /I "%time%"=="q" (
    ECHO Back to cmd.exe
    title %0% - But you quitted...
    goto Done
)
IF /I "%time%"=="h" (
    ECHO Back to homer
    title %0% - Homer it is...
    goto Homer
)
color 19
::if defined time (echo %1 NOT numeric && goto Start & (set time=) ) else (echo %1 && color 79)

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
echo %time% seconds elapsed!
echo ############# The Timer is Done ! #############

rundll32.exe cmdext.dll,MessageBeepStub
MSG * /v "Timer is done!"
pause
cls
echo Press a [key] :
set /p keytoinput="Another one [A] | Back to cmd [Q] | Close cmd[C]"
IF /I "%keytoinput%"=="a" (
    cls
    ECHO You got it.
    goto Start
)
IF /I "%keytoinput%"=="q" (
    ECHO Back to cmd.exe
    title %0% - This is it
    color 0A
    goto Done
)
IF /I "%keytoinput%"=="c" (
    ECHO You got it.
    goto Exit
)

goto Start

:Exit
Exit
goto Exit

:Done
echo Ciao! Done!
pause
cmd && exit /b
echo You Wont See This...

:Homer
:: From https://stackoverflow.com/questions/19642622/how-do-i-echo-ascii-art-that-contains-special-characters-in-a-batch-file
:::
:::              _ _,---._
:::           ,-','       `-.___
:::          /-;'               `._
:::         /\/          ._   _,'o \
:::        ( /\       _,--'\,','"`. )
:::         |\      ,'o     \'    //\
:::         |      \        /   ,--'""`-.
:::         :       \_    _/ ,-'         `-._
:::          \        `--'  /                )
:::           `.  \`._    ,'     ________,','
:::             .--`     ,'  ,--` __\___,;'
:::              \`.,-- ,' ,`_)--'  /`.,'
:::               \( ;  | | )      (`-/
:::                 `--'| |)       |-/
:::                   | | |        | |
:::                   | | |,.,-.   | |_
:::                   | `./ /   )---`  )
:::                  _|  /    ,',   ,-'
:::                 ,'|_(    /-<._,' |--,
:::                 |    `--'---.     \/ \
:::                 |          / \    /\  \
:::               ,-^---._     |  \  /  \  \
:::            ,-'        \----'   \/    \--`.
:::           /            \              \   \
:::

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A)
pause
goto Start

:: SET "var="&for /f "delims=0123456789" %%i in ("%1") do set var=%%i
:: if defined var (echo %1 NOT numeric) else (echo %1 numeric)