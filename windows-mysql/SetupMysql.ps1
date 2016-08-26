New-Item "C:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/mysql-installer-community-5.7.14.0.msi" -OutFile "c:\temp\mysql.msi"
Start-Process 'msiexec' -ArgumentList '/i "C:\temp\mysql.msi" /quiet /log C:\temp\mysql-install.log' -Wait | Out-File "C:\temp\mysqlsrv-install.log"