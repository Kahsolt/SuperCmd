@REM 2018-08-17
@REM using a template source file
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET TEMPLATES=%~dp0Templates
SET EXTS=.py;.rb;.lua

:init first use
IF NOT EXIST %~dp0Templates (
  MKDIR %~dp0Templates
  SET README=%~dp0Templates\README.md
  ECHO # This folder is used by script '%0' > %README%
  ECHO # Template files should be named 'main.xxx' or 'Makefile' >> %README%
  GOTO :EOF
)

IF /I "%1"=="mk" (
  SET SRC=%TEMPLATES%\Makefile
  SET DST="%~dp1Makefile"
) ELSE (
  SET SRC=%TEMPLATES%\main%~x1
  SET DST="%~dpnx1"
)
IF NOT EXIST %SRC% (ECHO No such template file for *%~x1... && GOTO :EOF)

COPY /V /-Y %SRC% %DST%
IF NOT %ERRORLEVEL% EQU 0 GOTO :EOF

:if append timestamp
ECHO %EXTS% | findstr /L /I %~x1 > NUL
IF %ERRORLEVEL% EQU 0 ECHO %DATE% >> %DST%
lf.cmd %DST%