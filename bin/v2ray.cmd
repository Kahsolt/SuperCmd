@REM 2018-10-02
@REM v2ray control script
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET V2RAYHOME=C:\Users\Kahsolt\.bin\Apps\v2ray
SET V2RAYBIN=%V2RAYHOME%\v2ray.exe
SET V2RAYCONFIG=%V2RAYHOME%\config.json
SET EDITOR=npp.lnk

:parse params
IF /I "%1"=="start" GOTO :start
IF /I "%1"=="editconfig" GOTO :editconfig
IF /I "%1"=="" GOTO :start
GOTO :help

:start
START /D %V2RAYHOME% %V2RAYBIN%
GOTO :EOF

:editconfig
START %EDITOR% %V2RAYCONFIG%
GOTO :EOF

:help
ECHO %0 usage:
ECHO   start       start service or isolate program instance
ECHO   editconfig  edit config file
ECHO   help        show this help
ECHO.
GOTO :EOF