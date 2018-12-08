@REM 2018-10-13
@REM start/manage vbox winxp vm

SETLOCAL ENABLEDELAYEDEXPANSION
SET VMMGR=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe
SET VMPATH=%USERPROFILE%\Documents\VirtualBox
SET VMNAME=Windows XP

IF /I "%1"=="zip" (
  "%VMMGR%" modifymedium "%VMPATH%\%VMNAME%\%VMNAME%.vdi" --compact
) ELSE (
  "%VMMGR%" startvm "%VMNAME%"
)