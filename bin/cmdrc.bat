@REM 2017-12-25
@REM the cmd.exe startup script
@ECHO OFF

:Console
PROMPT $P$G$S[$T]$_-$G$S
CHCP 65001 > NUL
rem CHCP 936 > NUL
rem TITLE Workspace
rem mode CON cols=80 lines=24
rem COLOR 9f
rem VERIFY on

:Path & EnvVar
IF DEFINED CMDRC GOTO :EndPath
rem SET PYTHONIOENCODING=utf8
SET PYTHONSTARTUP=%USERPROFILE%\.pythonrc
SET CMDRC=%~dpnx0
SET MSYS2_HOME=%SYSTEMDRIVE%\Msys64
SET MINICONDA_HOME=%SYSTEMDRIVE%\Miniconda3
SET JAVA_HOME=%ProgramFiles%\Java\jdk-13
rem SET NODE_HOME=%USERPROFILE%\.bin\Apps\node-v12.4.0-win-x64
SET NODE_PATH=%MSYS2_HOME%\mingw64\lib\node_modules
rem SET ANDROID_SDK_HOME=%LOCALAPPDATA%\Android\Sdk
SET COQ_HOME=%SYSTEMDRIVE%\Coq

SET PATHEXT=%PATHEXT%;.LNK
PATH %PATH%;%USERPROFILE%\.bin
PATH %PATH%;%MSYS2_HOME%\mingw64\bin;%MSYS2_HOME%\usr\bin
PATH %PATH%;%MINICONDA_HOME%;%MINICONDA_HOME%\Scripts;%MINICONDA_HOME%\Library\bin
PATH %PATH%;%JAVA_HOME%\bin
rem PATH %PATH%;%NODE_HOME%
rem PATH %PATH%;%ANDROID_SDK_HOME%\platform-tools
PATH %PATH%;%COQ_HOME%\bin
:EndPath

:Directory
SETLOCAL
SET HOME=%USERPROFILE%
SET DOCUMENTS=%USERPROFILE%\Documents
SET PICTURES=%USERPROFILE%\Pictures
SET VIDEOS=%USERPROFILE%\Videos
SET DESKTOP=%USERPROFILE%\Desktop

DOSKEY ..=PUSHD ..
rem DOSKEY app=PUSHD %LOCALAPPDATA%
rem DOSKEY appmenu=PUSHD %ProgramData%\Microsoft\Windows\Start Menu\Programs

DOSKEY oj=PUSHD %DOCUMENTS%\OJ
DOSKEY ai=PUSHD %DOCUMENTS%\AI
DOSKEY hw=PUSHD %DESKTOP%\Homework
DOSKEY qqbot=PUSHD %DOCUMENTS%\PycharmProjects\qqbot
DOSKEY qq=PUSHD %DOCUMENTS%\Tencent Files\784328306\FileRecv
DOSKEY wx=PUSHD %DOCUMENTS%\WeChat Files\kahsolt\FileStorage\File

DOSKEY abyss=PUSHD %VIDEOS%\渊
DOSKEY bili=PUSHD %PICTURES%\哔哩哔哩动画
DOSKEY chan=PUSHD %PICTURES%\Allchan
DOSKEY tb=PUSHD %PICTURES%\tieba
DOSKEY avo=PUSHD %PICTURES%\avogado6(アボガド6)
DOSKEY bb=PUSHD %PICTURES%\beautyboys
DOSKEY kona=PUSHD %PICTURES%\konachan
DOSKEY safe=PUSHD %PICTURES%\safebooru
DOSKEY yaoi=PUSHD %PICTURES%\yaoionly
DOSKEY bl=PUSHD %PICTURES%\buluo
DOSKEY benzi=PUSHD %PICTURES%\二次元正太屋
ENDLOCAL

:Kernal Program
DOSKEY rekey=npp.lnk %CMDRC%
DOSKEY keys=DOSKEY /MACROS ^| sort
DOSKEY :=ECHO $*
DOSKEY x=EXIT 0

DOSKEY cd=IF '$*'=='' (PUSHD %USERPROFILE%) ELSE (PUSHD $*)
DOSKEY po=POPD
DOSKEY l=DIR /O:NG /T:W /B $*
DOSKEY ls=DIR /O:NG /T:W /D $*
DOSKEY ll=DIR /O:NG /T:W /Q $*
DOSKEY la=DIR /O:NG /T:W /A $*
DOSKEY rdr=RMDIR /S /Q $*
DOSKEY ?=where $*
DOSKEY cha=attrib $*
rem DOSKEY cho=takeown $*
rem DOSKEY mount=subst $*

DOSKEY ps=tasklist /FI "SESSIONNAME ne Services" /NH $* ^| sort ^| cut -c 1-34
DOSKEY kill=taskkill /F /IM $* 
rem DOSKEY sudop=runas /user:ksland\kahsolt $*
DOSKEY reboot=shutdown /g /f /t 0
rem DOSKEY tp=ping www.baidu.com
DOSKEY killxl=taskkill /F /IM ThunderPlatform.exe ^&^& sudo sc stop XLServicePlatform

:External Program
rem DOSKEY cmp=compmgmt.msc
DOSKEY evt=eventvwr.msc
DOSKEY dev=devmgmt.msc
DOSKEY srv=services.msc
DOSKEY ctl=control.exe
rem DOSKEY prog=appwiz.cpl
rem DOSKEY re=regedit.exe
DOSKEY tsk=taskmgr.exe
rem DOSKEY passwd=cmdkey.exe $*

DOSKEY fm=explorer.exe $*
DOSKEY ed=nano.exe $*
DOSKEY np=notepad.exe $*
rem DOSKEY pnt=mspaint.exe $*
DOSKEY rdp=mstsc.exe $*
DOSKEY psh=START powershell.exe $*

:Nircmd Shortcut
rem DOSKEY nc=nircmdc.exe $*
DOSKEY su=nircmdc.exe elevate cmd.exe
DOSKEY lock=nircmdc.exe monitor off
rem DOSKEY scrot=nircmdc.exe savescreenshot "Screenshot_~$currdate.yyyyMMdd$_~$currtime.HHmmss$.png"
rem "Screenshot_%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.png"

:Tools
SETLOCAL ENABLEDELAYEDEXPANSION
SET MSYS2_BIN=%MSYS2_HOME%\usr\bin
DOSKEY file=file.exe -i $*
DOSKEY dus=du.exe -sh $*
rem DOSKEY rmr=rm.exe -r $*
DOSKEY ffind="%MSYS2_BIN%\find.exe" $*
DOSKEY ttree="%MSYS2_BIN%\tree.exe" $*
DOSKEY ssort="%MSYS2_BIN%\sort.exe" $*

DOSKEY sql=sqlite3.exe $*
DOSKEY py=python.exe $*
DOSKEY pynote=START jupyter.exe notebook
DOSKEY rb=IF '$*'=='' (irb.exe) ELSE (ruby.exe $*)
DOSKEY lua=IF '$*'=='' (lua5.1.exe -i -e "function dir(t) for k,v in pairs(t) do print(k,v) end end") ELSE (lua5.1.exe $*)
DOSKEY pl="%MSYS2_HOME%\mingw64\swipl-7.6.4\bin\swipl.exe" $*
DOSKEY pldoc="%MSYS2_HOME%\mingw64\swipl-7.6.4\doc\Manual\index.html"
ENDLOCAL
