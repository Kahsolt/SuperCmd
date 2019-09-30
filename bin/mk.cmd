@REM 2018-08-15
@REM batch gcc compile shortcut
@ECHO OFF

IF EXIST "%cd%\Makefile" (
  make.exe %*
  GOTO :EOF
)

IF /I "%1"=="" GOTO :EOF

IF /I "%1"=="all" (
  FOR /F %%i IN ('DIR *.c *.cpp /B /S') DO (
    CALL :compile %%i
  )
) ELSE IF /I "%1"=="clean" (
  DEL /F /S /Q *.exe
) ELSE (
  CALL :compile %1
)
GOTO :EOF


:compile
SET EXT=%~x1
IF /I "%EXT%"==".c" (
  gcc -std=c99 "%~dpnx1" -o "%~dpn1.exe"
) ELSE IF /I "%EXT%"==".cpp" (
  g++ -std=c++11 "%~dpnx1" -o "%~dpn1.exe"
)
GOTO :EOF