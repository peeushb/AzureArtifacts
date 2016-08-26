New-Item "c:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-maven-3.3.9-bin.zip" -OutFile "c:\temp\maven.zip"
New-Item "c:\maven" -ItemType Directory
Expand-Archive -Path "c:\temp\maven.zip" -DestinationPath "c:\maven"
$oldPath=(Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH).Path
$newPath=$oldPath+";c:\maven\bin"
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment" -Name PATH –Value $newPath