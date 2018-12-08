@REM 2018-10-02
@REM startup a downloader
@ECHO OFF

IF /I "%1"=="" (
  START thunder.lnk
) ELSE (
  START wget %1
)
