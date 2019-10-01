@REM 2018-10-24
@REM collect essential files to prepare a SuperCMD distro
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET PREFIX=%USERPROFILE%\.bin

:Migrate CmdPrompt
SET BIN=%PREFIX%
SET LOCAL_BIN=%~dp0\bin
IF EXIST %BIN% (
  IF NOT EXIST "%LOCAL_BIN%" MKDIR "%LOCAL_BIN%"
  XCOPY /-Y /D /K "%BIN%\*.*" "%LOCAL_BIN%"
)
SET BIN_TEMPLATE=%BIN%\Templates
IF EXIST "%BIN_TEMPLATE%" (
  XCOPY /-Y /D /K /S "%BIN_TEMPLATE%\*.*" "%LOCAL_BIN%\Templates\"
)
SET LOCAL_BIN_APPS=%LOCAL_BIN%\Apps
IF NOT EXIST "%LOCAL_BIN_APPS%" MKDIR "%LOCAL_BIN_APPS%"
ECHO. > %LOCAL_BIN_APPS%\.keep

:Migrate Powershell
SET PSH_PROFILE=%USERPROFILE%\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1
SET LOCAL_PSH=%~dp0\psh
IF EXIST %PSH_PROFILE% (
  IF NOT EXIST "%LOCAL_PSH%" MKDIR "%LOCAL_PSH%"
  XCOPY /-Y /D /K "%PSH_PROFILE%" "%LOCAL_PSH%"
)

:Migrate Msys2
SET MSYS2_USER=%SystemDrive%\Msys64\home\%USERNAME%
SET LOCAL_MSYS2_USER=%~dp0\msys2\home
IF EXIST %MSYS2_USER% (
  IF NOT EXIST "%LOCAL_MSYS2_USER%" MKDIR "%LOCAL_MSYS2_USER%"
  XCOPY /-Y /D /K "%MSYS2_USER%\.bash*" "%LOCAL_MSYS2_USER%"
  XCOPY /-Y /D /K "%MSYS2_USER%\.git*" "%LOCAL_MSYS2_USER%"
  XCOPY /-Y /D /K "%MSYS2_USER%\.minttyrc" "%LOCAL_MSYS2_USER%"
  XCOPY /-Y /D /K /S "%MSYS2_USER%\.ssh\*.*" "%LOCAL_MSYS2_USER%\.ssh\"
)
SET MSYS2_ETC=%SystemDrive%\Msys64\etc
SET LOCAL_MSYS2_ETC=%~dp0\msys2\etc
IF EXIST %MSYS2_ETC% (
  IF NOT EXIST "%LOCAL_MSYS2_ETC%" MKDIR "%LOCAL_MSYS2_ETC%"
  XCOPY /-Y /D /K "%MSYS2_ETC%\pacman.d\*.*" "%LOCAL_MSYS2_ETC%\pacman.d\"
)

ECHO ^>^> Done.
ECHO.