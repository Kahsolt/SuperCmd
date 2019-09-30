Rem 2019/03/28
Rem create shortcuts for files

Set argv = WScript.Arguments
If argv.Count <> 1 Then
  WScript.Echo "Usage: " & Wscript.ScriptName & " <target>"
  WScript.Quit
End If

Set sh = WScript.CreateObject("WScript.Shell")
Set fs = WScript.CreateObject("Scripting.FileSystemObject")

basedir = sh.SpecialFolders("Desktop")
cwd = fs.GetFile(Wscript.ScriptFullName).ParentFolder.Path
exefn = argv(0)
exefp = cwd & "\\" & exefn
lnkfn = Left(exefn, InStrRev(exefn, ".") - 1) & ".lnk"
lnkfp = basedir & "\\" & lnkfn

Set lnk = sh.CreateShortcut(lnkfp)
lnk.TargetPath = exefp
' lnk.WindowStyle = 3
' lnk.Hotkey = ""
' lnk.IconLocation = ""
' lnk.Description = ""
lnk.WorkingDirectory = ""
lnk.Save