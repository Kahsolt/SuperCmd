# SuperCMD

    Make your cmd.exe env more like GNU!

----

# Install
  - run `INSTALL.cmd /?` for help, (notice the use of %INSTDIR%)
  - dependencies
    - [Msys2](http://www.msys2.org): GNU tools bundled with everything!!
    - [Notepad++](https://notepad-plus-plus.org): my default GUI editor
  - recommands(optional)
    - [7zip](https://www.7-zip.org)
	- [chocolatey](https://chocolatey.org): package manager for Windows
	- [cmder_mini](http://cmder.net): ConEmu & clink
	- VirtualBox (if you need VMs, see sample [WinXP](bin/xp.cmd))
	- VcXsrv (if you use WSL and want a Xserver, see sample [Xwin](bin/xinit.cmd))

# Hierachy
  - .bin
    - Apps			绿色版软件放在这里，然后在父目录建立快捷方式
	- *.bat/*.cmd	自己写的cmd小脚本
	- *.exe			补充CUI程序/单文件小程序
	- *.lnk			常用GUI程序的快捷方式/硬链接

## my *.cmd usage reference
  - Shell/系统管理
    - rerc.cmd		不换窗口重启cmd(用于rekey后刷新当前环境)
    - lf.cmd		显示文件全路径(ls/l/la/ll家族的成员)
    - chkdsk@c.cmd	对C盘磁盘检查
    - defrag@c.cmd	对C盘碎片整理
  - 编程
    - gccf.cmd		对gcc/g++的包装
    - mk.cmd		对make的包装
    - cs.cmd		使用预定义的模板创建源代码文件(create script)
  - 应用快捷启动
    - dl.cmd		下载器适配脚本(download)
    - www.cmd		浏览器适配脚本
    - lynx.cmd		命令行浏览器lynx的启动脚本
    - play.cmd		用Windows Media Player播放媒体
    - show.cmd		用Windows Photo Viewer查看图片
    - 7za.cmd		用7z压缩指定文件/文件夹
    - xinit.cmd		启动Xserver
    - xp.cmd		启动VBox里的WinXP虚拟机

# Dev
  1. edit 'make.bat', determine which files are to be bundled in 
  your distro
  2. run `make.bat` to pack them up into 'bin' folder


by Kahsolt
2018/10/28