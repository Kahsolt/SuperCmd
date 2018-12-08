@REM 2018-10-24
@REM collect essential files to prepare a SuperCMD distro
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET PREFIX=%USERPROFILE%\.bin
SET MAKELIST=%~dp0make.list
SET DST=%~dp0bin

REM gen makelist and copy files
ECHO ; list of files under %PREFIX% > "%MAKELIST%"
ECHO ; used by make.bat >> "%MAKELIST%"
ECHO. >> "%MAKELIST%"
DIR /A:-D /B /O:NE %PREFIX% >> "%MAKELIST%"
IF NOT EXIST "%DST%" MKDIR "%DST%"
FOR /F %%f IN (make.list) DO XCOPY /Y /D /H "%PREFIX%\%%f" "%DST%"

REM folder special cases...
IF NOT EXIST "%DST%\Templates" MKDIR "%DST%\Templates"
XCOPY /Y /D /H "%PREFIX%\Templates" "%DST%\Templates"
IF NOT EXIST "%DST%\Apps" MKDIR "%DST%\Apps"
ECHO. > %DST%\Apps\.keep