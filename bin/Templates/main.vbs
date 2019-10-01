Rem %DATE%
Rem descrpition

Set argv = WScript.Arguments
If argv.Count <> 1 Then
  WScript.Echo "Usage: " & Wscript.ScriptName & " <target>"
  WScript.Quit
End If

Set sh = WScript.CreateObject("WScript.Shell")
Set fs = WScript.CreateObject("Scripting.FileSystemObject")
cwd = fs.GetFile(Wscript.ScriptFullName).ParentFolder.Path

