@REM 2018-10-02
@REM v2ray control script
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET V2RAYHOME=C:\Users\Kahsolt\.bin\Apps\v2ray-v3.26
SET V2RAYBIN=v2ray.exe
SET V2RAYCONFIG=config.json

SET EDITOR=npp.lnk

SET SVCNAME=v2ray
SET SVCBIN=%V2RAYHOME%\%V2RAYBIN%

:exists flag
SET SVCEXISTS=
sc query %SVCNAME% | findstr /I "STATE" > NUL
IF NOT ERRORLEVEL 1 SET SVCEXISTS=TRUE

:parse params
IF /I "%1"=="install" GOTO :install
IF /I "%1"=="uninstall" GOTO :uninstall
IF /I "%1"=="start" GOTO :start
IF /I "%1"=="stop" GOTO :stop
IF /I "%1"=="restart" GOTO :restart
IF /I "%1"=="editconfig" GOTO :editconfig
IF DEFINED SVCEXISTS GOTO :start
GOTO :help

:install
IF DEFINED SVCEXISTS GOTO :EOF

SET STARTUP_TYPE=auto
CHOICE /C YN /M "Autorun %SVCNAME% at startup?"
IF %ERRORLEVEL%==2 SET STARTUP_TYPE=demand
GOTO :runas
sc create %SVCNAME% ^
    binpath= %SVCBIN% ^
    displayname= %SVCNAME% ^
    start= %STARTUP_TYPE%
ECHO %SVCNAME% installed
GOTO :EOF

:uninstall
IF DEFINED SVCEXISTS (
  GOTO :runas
  sc delete %SVCNAME%
  ECHO %SVCNAME% uninstalled
)
GOTO :EOF

:start
IF DEFINED SVCEXISTS (
  sc start %SVCNAME%
  ECHO %SVCNAME% started as service
) ELSE (
  START /D %V2RAYHOME% %V2RAYBIN%
  ECHO %V2RAYBIN% started as standalone
)
GOTO :EOF

:stop
IF DEFINED SVCEXISTS (
  sc stop %SVCNAME%
  ECHO %SVCNAME% stopped
)
GOTO :EOF

:restart
GOTO :stop
GOTO :start
GOTO :EOF

:editconfig
%EDITOR% %V2RAYHOME%\%V2RAYCONFIG%
GOTO :EOF

:help
ECHO %0 usage:
ECHO   install     install as a windows service
ECHO   uninstall   uninstall service
ECHO   start       start service or isolate program instance
ECHO   stop        stop service
ECHO   restart     restart service or isolate program instance
ECHO   editconfig  edit config file
ECHO   help        this help
ECHO.
IF DEFINED SVCEXISTS (
  ECHO service '%SVCNAME%' is installed.
) ELSE (
  ECHO service '%SVCNAME%' is NOT yet installed.
)
GOTO :EOF

:runas
SET TMPDIR=%SystemRoot%\~%~n0_UAC_%RANDOM%
SET UACSCRIPT=%TMP%\%~n0_UAC_%RANDOM%.vbs
MKDIR "%TMPDIR%" 2> NUL
IF "%ERRORLEVEL%"=="0" (
  RMDIR "%TMPDIR%" > NUL 2> NUL
) ELSE (
  ECHO CreateObject^("Shell.Application"^).ShellExecute "%~f0", "%*", "", "runas", 1 > "%UACSCRIPT%"
  "%UACSCRIPT%"
  DEL /F /Q "%UACSCRIPT%"
)
GOTO :EOF