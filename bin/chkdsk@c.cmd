@REM 2018-06-15
@REM chkdsk C: restart required

ECHO y | CHKDSK C: /F /V /R /X /B /scan /perf
shutdown /r /f /t 0 /d p:1:1 /c "fdisk"