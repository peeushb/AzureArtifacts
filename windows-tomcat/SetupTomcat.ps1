New-Item "c:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-tomcat-8.5.4.exe" -OutFile "c:\temp\tomcat8.exe"
Start-Process "C:\temp\tomcat8.exe" -ArgumentList "/S" -Wait