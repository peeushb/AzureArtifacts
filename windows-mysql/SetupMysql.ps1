New-Item "c:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/mysql-installer-community-5.7.14.0.msi" -OutFile "c:\temp\mysql.msi"
Start-Process "msiexec" -ArgumentList "/i ""C:\temp\mysql.exe"" /quiet" -Wait