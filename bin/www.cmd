@REM 2018-09-24
@REM startup a web browser
@ECHO OFF

IF /I "%1"=="" (
  START lynx.cmd
) ELSE (
  START firefox.lnk %1
)
