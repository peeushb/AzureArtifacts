# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/eclipse-jee-luna-SR2-win32-x86_64.zip" -OutFile "C:\temp\eclipse-luna.zip"

# Extract Eclipse files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\eclipse-luna.zip")
# Ensure folder is empty before extracting files
Remove-Item "c:\eclipse\*" -Recurse -ErrorAction SilentlyContinue
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

# Update PATH Environment variable
#$Reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
#$oldPath=(Get-ItemProperty -Path "$Reg" -Name PATH).Path
#$newPath=$oldPath+";C:\eclipse"
#Set-ItemProperty -Path "$Reg" -Name PATH -Value $newPath

# Create a Shortcut with Windows PowerShell
#$TargetFile = "C:\eclipse\eclipse.exe"
#$ShortcutFile = "$env:Public\Desktop\Eclipse.lnk"
#$WScriptShell = New-Object -ComObject WScript.Shell
#$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
#$Shortcut.TargetPath = $TargetFile
#$Shortcut.Save()