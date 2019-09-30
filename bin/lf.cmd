@REM 2018-08-16
@REM list directory by fullpath
@ECHO OFF

FOR /F %%f IN ('DIR /O:NG /T:W /B %1') DO ECHO %%~ff