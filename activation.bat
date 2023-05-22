REM The "Activate Windows" banner is typically displayed when Windows is not activated with a valid license key.
REM Restarting Windows Explorer will temporarily remove the banner, but it may reappear later if the underlying activation issue is not resolved.
REM If you are encountering the "Activate Windows" banner, I would recommend ensuring that your Windows installation is properly activated with a valid license key.

REM Developer: Jan Gebser
REM Github: @Brainhub24
REM Code created: 21.05.2019
REM Code updated: 22.05.2023

@echo off
rem Turn off the display of commands and output

taskkill /F /IM explorer.exe && (
  echo Explorer.exe terminated successfully.
  explorer.exe
  rem Restart the "explorer.exe" process
) || (
  echo Failed to terminate explorer.exe.
)

exit
rem Exit the batch script
