@REM 2018/10/28
@REM install/uninstall SuperCMD
@REM (!!this script rely on nircmdc.exe)
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET SRC=%~dp0bin
IF DEFINED INSTDIR (SET DST=%INSTDIR%) ELSE (SET DST=%USERPROFILE%\.bin)
rem SET DST=%~dp0.testbin

:check_installfiles
IF NOT EXIST %SRC% (ECHO bad distro, missing 'bin' folder.. && GOTO :EOF)

:check_params
IF /I "%1"=="" GOTO :install
IF /I "%1"=="/I" GOTO :install
IF /I "%1"=="/U" GOTO :uninstall
GOTO :help

:install
IF EXIST "%DST%" (ECHO SuperCMD already installed at %DST%, quit. && GOTO :EOF)
CHOICE /C YN /M "Installing SuperCMD to %DST%, Sure?"
IF %ERRORLEVEL%==2 GOTO :EOF
  MKDIR "%DST%" && XCOPY /H /D /Y "%SRC%" "%DST%"
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