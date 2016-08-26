New-Item "c:\temp" -ItemType Directory
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-tomcat-7.0.70.exe" -OutFile "c:\temp\tomcat7.exe"
Start-Process "C:\temp\tomcat7.exe" -ArgumentList "/S" -Wait