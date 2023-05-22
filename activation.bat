@echo off
REM The "Activate Windows" banner is typically displayed when Windows is not activated with a valid license key.
REM Restarting Windows Explorer will temporarily remove the banner, but it may reappear later if the underlying activation issue is not resolved.
REM If you are encountering the "Activate Windows" banner, I would recommend ensuring that your Windows installation is properly activated with a valid license key.

REM Developer: Jan Gebser
REM Github: @Brainhub24
REM Code created on: 21.05.2019

REM This script terminates the explorer.exe process, restarts it, and then exits.

taskkill /F /IM explorer.exe
REM Taskkill command is used to forcefully terminate the explorer.exe process.

explorer.exe
REM Starts the explorer.exe process, which manages the Windows desktop and file explorer.

exit
REM Exits the batch script execution.
