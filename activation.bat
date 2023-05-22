REM The "Activate Windows" banner is typically displayed when Windows is not activated with a valid license key.
REM Restarting Windows Explorer will temporarily remove the banner, but it may reappear later if the underlying activation issue is not resolved.
REM If you are encountering the "Activate Windows" banner, I would recommend ensuring that your Windows installation is properly activated with a valid license key.

REM Developer: Jan Gebser
REM Github: @Brainhub24
REM Github constributions: @PHP24
REM Code created: 21.05.2019
REM Code updated: 22.05.2023

@echo off
rem Turn off the display of commands and output

setlocal enabledelayedexpansion

set "installFlag=%UserProfile%\activate_banner_installed.txt"
set "codeOfConductFile=code_of_conduct.txt"
set "disclaimerFile=disclaimer.txt"
set "logFile=%UserProfile%\activate_banner_log.txt"

rem Check if the installation flag exists
if exist "%installFlag%" (
    echo The "Activate Windows" banner has already been removed.
    pause
    exit
)

rem Validate paths of text files
if not exist "%codeOfConductFile%" (
    echo Error: Code of Conduct file not found.
    pause
    exit /b 1
)

if not exist "%disclaimerFile%" (
    echo Error: Disclaimer file not found.
    pause
    exit /b 1
)

rem Display the code of conduct
type "%codeOfConductFile%"
echo.
echo Code of Conduct:
echo Please read and accept the code of conduct to continue.
echo.

set /p "codeOfConductChoice=Do you accept the code of conduct? (Y/N): "
if /i "%codeOfConductChoice%"=="N" (
    echo Operation cancelled by user.
    pause
    exit
)

rem Display the disclaimer
type "%disclaimerFile%"
echo.
echo Disclaimer:
echo Please read and accept the disclaimer to continue.
echo.

set /p "disclaimerChoice=Do you accept the disclaimer? (Y/N): "
if /i "%disclaimerChoice%"=="N" (
    echo Operation cancelled by user.
    pause
    exit
)

rem Modify the registry to remove the banner
reg add "HKCU\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 0 /f
if %errorlevel% neq 0 (
    echo Error: Failed to modify the registry.
    pause
    exit /b %errorlevel%
)

rem Terminate and restart the Windows Explorer process
taskkill /F /IM explorer.exe
explorer.exe
if %errorlevel% neq 0 (
    echo Error: Failed to restart Windows Explorer.
    pause
    exit /b %errorlevel%
)

rem Create the installation flag
echo Installation complete. The "Activate Windows" banner will no longer appear.
echo.
echo Press any key to continue.
pause >nul
echo Installation complete. The "Activate Windows" banner will no longer appear.>"%installFlag%"

rem Log the installation
echo [%date% %time%] Installation completed successfully.>>"%logFile%"

exit /b 0

