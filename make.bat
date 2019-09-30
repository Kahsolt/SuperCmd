@REM 2018-10-24
@REM collect essential files to prepare a SuperCMD distro
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET PREFIX=%USERPROFILE%\.bin
SET MAKELIST=%~dp0make.list
SET BIN=%~dp0bin

REM gen makelist
ECHO ; list of files under %PREFIX% > "%MAKELIST%"
ECHO ; used by make.bat >> "%MAKELIST%"
ECHO. >> "%MAKELIST%"

REM list up all files under %PREFIX%
DIR /A:-D /B /O:NE %PREFIX% >> "%MAKELIST%"
ECHO ^>^> Generating make.list
ECHO.

REM checkpoint
ECHO ^>^> Now please check items in:
ECHO ^>^>   %MAKELIST%
ECHO ^>^> before copy, you can make changes to it
ECHO ^>^> save it and press [Enter] to continue...
ECHO.
PAUSE

REM %PREFIX%\bin
SET DIR=%BIN%
IF NOT EXIST "%DIR%" MKDIR "%DIR%"
FOR /F %%f IN (make.list) DO XCOPY /Y /D /H "%PREFIX%\%%f" "%DIR%"

REM %PREFIX%\bin\Templates
SET DIR=%BIN%\Templates
IF NOT EXIST "%DIR%" MKDIR "%DIR%"
XCOPY /Y /D /H "%PREFIX%\Templates" "%DIR%"

REM %PREFIX%\bin\App
SET DIR=%BIN%\Apps
IF NOT EXIST "%DIR%" MKDIR "%DIR%"
ECHO. > %DIR%\.keep

ECHO ^>^> Done.
ECHO.