@REM 2018-06-14
@REM play music with meida player
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET PLAYER=%ProgramFiles%\Windows Media Player\wmplayer.exe

START /B "%PLAYER%" "%~dpnx1"