New-Item "C:\temp" -ItemType Directory
New-Item "C:\maven" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-maven-3.3.9-bin.zip" -OutFile "C:\temp\maven.zip"
Expand-Archive -Path "C:\temp\maven.zip" -DestinationPath "C:\maven"
$oldPath=(Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH).Path
$newPath=$oldPath+";C:\maven\bin"
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH –Value $newPath