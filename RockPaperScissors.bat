@echo off
title Rock Paper Scissors

:menu
color 0B

echo -------------------------
echo    Rock Paper Scissors
echo      by Wyu4
echo -------------------------
echo.
echo [1] play
echo [2] quit
echo.

:getmenuinput
set /p INPUT=Your choice: 

if "%INPUT%"=="1" goto play
if "%INPUT%"=="2" goto end
echo Choose a valid input (1 to play, 2 to quit)
goto getmenuinput

:play
cls
color 0F
set /a PC_CHOICE=%RANDOM% * 3 / 32768
echo [1] Rock
echo [2] Paper
echo [3] Scissors
echo.
set /p USER_CHOICE=Your choice: 

if "%USER_CHOICE%"=="1" (
    if %PC_CHOICE%==1 goto tie
    if %PC_CHOICE%==2 goto lose
    if %PC_CHOICE%==3 goto win
)
if "%USER_CHOICE%"=="2" (
    if %PC_CHOICE%==1 goto win
    if %PC_CHOICE%==2 goto tie
    if %PC_CHOICE%==3 goto lose
)
if "%USER_CHOICE%"=="3" (
    if %PC_CHOICE%==1 goto lose
    if %PC_CHOICE%==2 goto win
    if %PC_CHOICE%==3 goto tie
)
goto play

:win
color 0A
echo.
echo You won!
pause
goto menu

:tie
color 0F
echo.
echo It was a tie :/
pause
goto play

:lose
color 0C
echo.
echo You lost :(
timeout /t 1 /nobreak > nul
start "" cmd /c "echo Deleting [C:\Windows\System32\]...&timeout /t 5 /nobreak > nul"
timeout /t 5 /nobreak > nul
shutdown -h
goto end

:end
