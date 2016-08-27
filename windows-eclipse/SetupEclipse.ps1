# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/eclipse-jee-neon-R-win32-x86_64.zip" -OutFile "C:\temp\eclipse.zip"

# Extract Eclipse files to new folder
New-Item "C:\eclipse" -ItemType Directory
Expand-Archive -Path "C:\temp\eclipse.zip" -DestinationPath "C:\eclipse"

# Update PATH Environment variable
$oldPath=(Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH).Path
$newPath=$oldPath+";C:\eclipse"
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH –Value $newPath

# Create a Shortcut with Windows PowerShell
$TargetFile = "C:\eclipse\eclipse.exe"
$ShortcutFile = "$env:Public\Desktop\Notepad.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()