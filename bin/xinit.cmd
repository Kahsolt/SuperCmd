@REM 2018-05-11
@REM start xserver on windows

SETLOCAL ENABLEDELAYEDEXPANSION
SET XSRV=%ProgramFiles%\VcXsrv\XLaunch.exe
SET XCONF=%~dp0X.xlaunch

"%XSRV%" -run "%XCONF%"
