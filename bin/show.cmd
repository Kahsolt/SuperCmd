@REM 2018-10-10
@REM show pictures with photo viewer
@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SET VIEWER=%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll

REM the file path MUST NOT be quoted!
rundll32 "%VIEWER%", ImageView_Fullscreen %~dpnx1