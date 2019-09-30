@REM 2018-06-15
@REM maintance on data disk

SETLOCAL ENABLEDELAYEDEXPANSION
SET DRIVER=D:

IF /I "%1"=="defrag" (
  defrag %DRIVER% /O /H /U /V
) ELSE IF /I "%1"=="chkdsk" (
  ECHO y | CHKDSK %DRIVER% /F /V /R /X /B /scan /perf
  shutdown /r /f /t 0 /d p:1:1 /c "fdisk"
)