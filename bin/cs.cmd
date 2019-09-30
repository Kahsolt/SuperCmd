@REM 2018-08-17
@REM using a template source/license file
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET TEMPLATES=%~dp0Templates
SET EXTS=.py;.rb;.lua;.js;.md

:init first use
SET README=%TEMPLATES%\_README.txt
IF NOT EXIST %TEMPLATES% (
  MKDIR %TEMPLATES%
  ECHO # This folder is used by script '%0' > %README%
  ECHO # Template files should be named 'main.xxx' >> %README%
  ECHO # or 'Makefile' 'LICENSE' 'README.md' >> %README%
  GOTO :EOF
)

SET SRC=
SET DST=.
SET EXT=%~x1
IF /I "%1"=="lic" (
  SET SRC=%TEMPLATES%\LICENSE
  SET DST=%~dp1\LICENSE
) ELSE IF /I "%1"=="mk" (
  SET SRC=%TEMPLATES%\Makefile
  SET DST=%~dp1\Makefile
) ELSE IF /I "%1"=="md" (
  SET SRC=%TEMPLATES%\README.md
  SET DST=%~dp1\README.md
) ELSE (
  SET SRC=%TEMPLATES%\main%EXT%
  SET DST=%~dpnx1
)
IF NOT EXIST "%SRC%" (
  ECHO No such template file for *%EXT%...
  GOTO :EOF
)

COPY /V /-Y "%SRC%" "%DST%"
IF NOT %ERRORLEVEL% EQU 0 GOTO :EOF

:append timestamp
IF /I "%1"=="lic" (
  GOTO :show
) ELSE IF /I "%1"=="mk" (
  GOTO :show
) ELSE IF /I "%1"=="md" (
  ECHO %DATE% >> %DST%
) ELSE (
  ECHO %EXTS% | findstr /L /I %EXT% > NUL
  rem IF %ERRORLEVEL% EQU 0 ECHO %DATE:~3% >> %DST%
  IF %ERRORLEVEL% EQU 0 ECHO %DATE% >> %DST%
)

:show
lf.cmd %DST%