# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Maven
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-maven-3.3.9-bin.zip" -OutFile "C:\temp\maven.zip"

# Extract Maven files to new folder
New-Item "C:\maven" -ItemType Directory
Expand-Archive -Path "C:\temp\maven.zip" -DestinationPath "C:\maven"

# Update PATH Environment variable
$oldPath=(Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH).Path
$newPath=$oldPath+";C:\maven\bin"
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH –Value $newPath

# Create a Shortcut with Windows PowerShell
$TargetFile = "C:\maven\maven.exe"
$ShortcutFile = "$env:Public\Desktop\Notepad.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()