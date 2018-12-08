@REM 2018-08-15
@REM batch gcc compile shortcut
@ECHO OFF

IF EXIST "%cd%\Makefile" (
  make.exe %*
) ELSE (
  IF /I "%1"=="all" (
    FOR /F %%i IN ('DIR *.c *.cpp /B /S') DO (
      CD %%~dpi
      gccf.cmd %%i
    )
  ) ELSE IF /I "%1"=="clean" (
     DEL /F /S /Q *.exe
  ) ELSE ECHO %0 ^<all^|clean^>
)
