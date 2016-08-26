New-Item "c:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/eclipse-java-neon-R-win32-x86_64.zip" -OutFile "C:\temp\eclipse.zip"
Expand-Archive -Path "C:\temp\eclipse.zip" -DestinationPath "C:\eclipse"
$oldPath=(Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH).Path
$newPath=$oldPath+";C:\eclipse"
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH –Value $newPath