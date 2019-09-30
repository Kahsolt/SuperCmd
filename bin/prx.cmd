@REM 2019/01/31
@REM start proxy local
@ECHO OFF

IF /I "%1"=="off" (
  SET http_proxy=
  SET https_proxy=
  ECHO "proxy off"
) ELSE (
  SET http_proxy=127.0.0.1:1080
  SET https_proxy=127.0.0.1:1080
  ECHO "proxy on"

  tasklist /FI "IMAGENAME eq v2ray.exe" | findstr /I "No" > NUL
  IF %ERRORLEVEL% EQU 0 CALL v2ray.cmd start
)
