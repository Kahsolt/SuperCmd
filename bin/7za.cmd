@REM 2018-09-22
@REM make a highly compressed archive
@ECHO OFF

IF "%1"=="" GOTO :EOF
7z a -mx9 %~n1.7z %1