# Console
function Prompt {
  "$(Get-Location)> [$($([DateTime]::Now).ToString())]`nPS > "
}
#chcp 65001 | Out-Null

# Environments
$Env:PATHEXT += ";.LNK"
$Env:MSYS2_HOME = "${Env:SYSTEMDRIVE}\Msys64"
$Env:MINICONDA_HOME = "${Env:SYSTEMDRIVE}\Miniconda3"
$Env:JAVA_HOME = "${Env:ProgramFiles}\Java\jdk-12.0.1"
$Env:NODE_HOME = "${Env:USERPROFILE}\.bin\Apps\node-v12.4.0-win-x64"
$Env:NODE_PATH = "${Env:NODE_HOME}\node_modules"

$Env:Path += ";${Env:USERPROFILE}\.bin"
$Env:Path += ";${Env:MSYS2_HOME}\mingw64\bin;${Env:MSYS2_HOME}\usr\bin"
$Env:Path += ";${Env:MINICONDA_HOME};${Env:MINICONDA_HOME}\Scripts;${Env:MINICONDA_HOME}\Library\bin"
$Env:Path += ";${Env:NODE_HOME}\bin"

# Directory
$mc="$HOME\Documents\Minecraft\Minecraft"

# Internal Command
Set-Alias new New-Object
Set-Alias lsdrv Get-PSDrive
Set-Alias cw Push-Location
Set-Alias po Pop-Location

# External Program
Set-Alias ed nano.exe
Set-Alias np notepad.exe
Set-Alias pnt mspaint.exe
Set-Alias fm explorer.exe

# Chocolatey profile
$ChocolateyProfile = "$Env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
If (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
