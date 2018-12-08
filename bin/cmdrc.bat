@REM 2017-12-25
@REM the cmd.exe startup script
@ECHO OFF

:Console
PROMPT $P$G$S[$T]$_-$G$S
CHCP 936
rem TITLE Workspace
rem mode CON cols=80 lines=24
rem COLOR 9f
rem VERIFY on

:Path
IF DEFINED CMDRC GOTO :EndPath
SET CMDRC=%~dpnx0
rem SET H=%USERPROFILE%
rem SET D=%USERPROFILE%\Desktop
SET BIN_HOME=%USERPROFILE%\.bin
rem SET WSL_HOME=%LOCALAPPDATA%\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs
SET MSYS2_HOME=%SYSTEMDRIVE%\Msys64
rem SET JAVA_HOME=%ProgramFiles%\Java\jdk1.8.0_151
rem SET ANDROID_SDK_HOME=%LOCALAPPDATA%\Android\Sdk

SET PATHEXT=%PATHEXT%;.LNK
PATH %PATH%;%USERPROFILE%\.bin
PATH %PATH%;%MSYS2_HOME%\mingw64\bin;%MSYS2_HOME%\usr\bin
rem PATH %PATH%;%JAVA_HOME%\bin
rem PATH %PATH%;%ANDROID_SDK_HOME%\platform-tools
:EndPath

:Directory
doskey ..=PUSHD ..
rem doskey bin=PUSHD %USERPROFILE%\.bin
rem doskey app=PUSHD %LOCALAPPDATA%
rem doskey m2=PUSHD %MSYS2_HOME%\home\Kahsolt
rem doskey mc=PUSHD %USERPROFILE%\3D Objects\Minecraft\Minecraft
rem doskey appmenu=PUSHD %ProgramData%\Microsoft\Windows\Start Menu\Programs
doskey bili=PUSHD %USERPROFILE%\Pictures\ﬂŸ¡®ﬂŸ¡®∂Øª≠
doskey qq=PUSHD %LOCALAPPDATA%\Packages\903DB504.QQ_a99ra4d2cbcxa\LocalState\User\784328306\NetworkFile
doskey tim=PUSHD %USERPROFILE%\Documents\Tencent Files\784328306\FileRecv
doskey allchan=PUSHD %USERPROFILE%\Pictures\Allchan
doskey tieba=PUSHD %USERPROFILE%\Pictures\BaiduTieba

:Internal Program
doskey rekey=npp.lnk %CMDRC%
doskey keys=cmd /C "doskey /MACROS | sort"
doskey cd=IF '$*'=='' (PUSHD %USERPROFILE%) ELSE (PUSHD $*)
doskey po=POPD
doskey l=DIR /O:NG /T:W /B $*
doskey ls=DIR /O:NG /T:W /D $*
doskey ll=DIR /O:NG /T:W /Q $*
doskey la=DIR /O:NG /T:W /A $*
doskey ?=where $*
doskey cha=attrib $*
rem doskey cho=takeown $*
rem doskey mount=subst $*
doskey ps=cmd /C "tasklist /FI ""SESSIONNAME ne Services"" /NH $* | sort | cut -c 1-34"
doskey kill=tskill $* /A /V
rem doskey sudop=runas /user:ksland\kahsolt $*
doskey reboot=shutdown /g /f /t 0
doskey tp=ping www.baidu.com
doskey :=ECHO $*
doskey x=EXIT 0

:External Program
rem doskey cmp=compmgmt.msc
doskey evt=eventvwr.msc
doskey dev=devmgmt.msc
doskey srv=services.msc
doskey ctl=control.exe
rem doskey prog=appwiz.cpl
rem doskey re=regedit.exe
doskey tsk=taskmgr.exe
rem doskey passwd=cmdkey.exe $*

doskey fm=explorer.exe $*
rem doskey fm=explorer.exe $*
doskey ed=nano.exe $*
doskey np=notepad.exe $*
doskey pnt=mspaint.exe $*
rem doskey rdp=mstsc.exe $*
doskey psh=START powershell.exe $*
doskey ubu=START ubuntu.exe $*

:Nircmd Shortcut
rem doskey nc=nircmdc.exe $*
doskey su=nircmdc.exe elevate cmd.exe
doskey sudo=nircmdc.exe elevate $*
doskey lock=nircmdc.exe monitor off
rem doskey scrot=nircmdc.exe savescreenshot "Screenshot_~$currdate.yyyyMMdd$_~$currtime.HHmmss$.png"
rem "Screenshot_%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.png"

:MinGW Tools
SETLOCAL ENABLEDELAYEDEXPANSION
SET MSYS2_BIN=%MSYS2_HOME%\usr\bin
doskey file=file.exe -i $*
doskey dus=du.exe -sh $*
doskey rmr=rm.exe -r $*
doskey ffind="%MSYS2_BIN%\find.exe" $*
doskey ttree="%MSYS2_BIN%\tree.exe" $*
doskey py=python3.exe $*
doskey rb=ruby.exe $*
doskey lua=IF '$*'=='' (lua.exe -i -e "function dir(t) for k,v in pairs(t) do print(k,v) end end") ELSE (lua.exe $*)
ENDLOCAL

:Clink Injection
doskey clink="%BIN_HOME%\Apps\cmder_mini\vendor\clink\clink.bat" inject --autorun