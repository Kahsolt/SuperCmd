@REM 2018/10/28
@REM install/uninstall SuperCMD
@REM (!!this script rely on nircmdc.exe)
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET SRC=%~dp0bin
IF DEFINED INSTDIR (SET DST=%INSTDIR%) ELSE (SET DST=%USERPROFILE%\.bin)
rem SET DST=%~dp0.testbin

:check_params
IF /I "%1"=="" GOTO :install
IF /I "%1"=="/I" GOTO :install
IF /I "%1"=="/U" GOTO :uninstall
GOTO :help

:install
:Migrate Powershell
SET PSH_PROFILE=%~dp0\psh\Microsoft.PowerShell_profile.ps1
SET PSH=%USERPROFILE%\Documents\WindowsPowershell
IF EXIST %PSH_PROFILE% (
  XCOPY /-Y /D /K "%PSH_PROFILE%" "%PSH%\"
)

:Migrate Msys2
SET MSYS2_USER=%SystemDrive%\Msys64\home\%USERNAME%
SET LOCAL_MSYS2_USER=%~dp0\msys2\home
IF EXIST %MSYS2_USER% (
  XCOPY /-Y /D /K /S "%LOCAL_MSYS2_USER%\.*" "%MSYS2_USER%\"
)
SET MSYS2_ETC=%SystemDrive%\Msys64\etc
SET LOCAL_MSYS2_ETC=%~dp0\msys2\etc
IF EXIST %MSYS2_ETC% (
  XCOPY /-Y /D /K "%LOCAL_MSYS2_ETC%\*" "%MSYS2_ETC%\"
)

:Migrate CmdPrompt
CHOICE /C YN /M "Installing SuperCMD to %DST%, Sure?"
IF %ERRORLEVEL%==2 GOTO :EOF
  MKDIR "%DST%" && XCOPY /-Y /D /K "%SRC%" "%DST%"
  nircmdc.exe regsetval sz "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" "Autorun" "%DST%\cmdrc.bat"

ECHO Installed!
CLS && CD %DST%
START /I /B & EXIT 0
GOTO :EOF

:uninstall
CHOICE /C YN /M "Uninstalling SuperCMD from %DST%, Sure?"
IF %ERRORLEVEL%==2 GOTO :EOF
  RMDIR /S /Q "%DST%"
  nircmdc.exe regdelval "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" "Autorun"
ECHO Uninstalled.
GOTO :EOF

:help
ECHO Usage: %0 ^</I^|/U^>
ECHO   /I	install (default: %DST%
ECHO                  or set envvar %%INSTDIR%% with FULL path)
ECHO   /U	uninstall
GOTO :EOF