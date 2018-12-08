@REM 2018-06-15
@REM wrapper for gcc compiler
@ECHO OFF

IF /I "%~x1"==".cpp" (
  g++ -std=c++11 %1 -o "%~n1.exe"
) ELSE (
  gcc -std=c99 %1 -o "%~n1.exe"
)
