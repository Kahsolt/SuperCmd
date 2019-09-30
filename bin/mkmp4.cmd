@REM 2019/07/13
@REM compress and make MP4 videos using ffmpeg
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

IF "%~1"=="" GOTO :help
IF "%~2"=="" GOTO :help
IF NOT "%~3"=="" SET P=%~3

rem MP4 bit-rate is altrable 800k
rem MP3 bit-rate should not be lower than 128k
rem subtitles in MP4 only supports mov_text
ffmpeg -y -i "%~1" ^
  -c:v libx264 -r 24 -b:v 512k ^
  -c:a libmp3lame -b:a 128k ^
  -c:s mov_text "%~2\%~n1.mp4"
GOTO :EOF

:help
ECHO "Usage: %~nx0 <input filename> <output diretory>"
GOTO :EOF