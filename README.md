# SuperCMD

    Make your cmd.exe environment more like shell in GNU !

----

# Targeted for Windows Platforms Only

## Installation Guide
  - all you need is just run `INSTALL.cmd /I`; you could also check `INSTALL.cmd /?` for more option (please notice the use of %INSTDIR%)
  - highly recommended tool suite:
    - [Msys2](http://www.msys2.org): GNU tools bundled with pacman and anything!!
    - [Miniconda](https://docs.conda.io/en/latest/miniconda.html): life is even shorter..
    - [Notepad++](https://notepad-plus-plus.org): my default GUI text editor
    - [7zip](https://www.7-zip.org): best compressor ever
  - other optional recommends:
    - [XShell](https://www.netsarang.com/zh/xshell): ssh client better than PuTTY
	  - [cmder_mini](http://cmder.net): ConEmu & clink
  	- [chocolatey](https://chocolatey.org): package manager for Windows
	  - VirtualBox (if you need VMs, see sample [WinXP](bin/xp.cmd))
	  - VcXsrv (if you use WSL and want a Xserver, see sample [Xinit](bin/xinit.cmd) and [Xlaunch](bin/X.xlaunch)))

## Hierachy under %INSTDIR% after installation
  - .bin\
    - Apps\			  绿色软件放在这里，然后在父目录建立快捷方式
  	- *.bat       最重要的控制台初始化脚本[cmdrc.bat](/bin/cmdrc.bat)(相当于.bashrc)
  	- *.cmd	      自己写的cmd小脚本
  	- *.vbs	      自己写的vbs小脚本
  	- *.exe			  补充CUI程序/单文件小程序
  	- *.lnk			  常用GUI程序的快捷方式
  	- *.txt       某些软件快捷键的备忘录或者笔记什么的

### my frequently used *.cmd and DOSKEY commands references
  - Shell/系统管理
    - rekey         编辑cmdrc.bat
    - rerc.cmd		  不换窗口重启cmd(用于rekey后刷新当前环境)
    - sudo.cmd      提权运行某程序
    - lf.cmd		    显示文件全路径(ls/l/la/ll家族的成员)
    - fdisk.cmd	    对D盘磁盘检查/碎片整理
    - prx.cmd       配置代理变量http_proxy/https_proxy
    - v2ray.cmd     管理梯子软件
  - 编程相关
    - gccf.cmd		  对gcc/g++的包装
    - mk.cmd		    对make的包装
    - cs.cmd		    使用预定义的[模板](/bin/Templates)创建源代码文件(create script)
  - 应用快捷启动
    - view.cmd		  用Windows Photo Viewer查看图片
    - play.cmd		  用Windows Media Player播放媒体
    - dl.cmd		    下载器适配脚本(downloader)
    - 7za.cmd		    用7z压缩指定文件/文件夹
    - xinit.cmd		  启动Xserver
    - xp.cmd		    启动VBox里的WinXP虚拟机

## Dev
  1. edit 'make.bat', determine which files and directories are to be bundled within your distro
  2. run `make.bat` to pack them up into 'bin' folder
  3. tarball this folder to your target PC and run `INSTALL.cmd` to gently install everything :laughing:

----

by Kahsolt
2018/10/28
2019/09/30