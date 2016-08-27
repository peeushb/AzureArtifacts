# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Tomcat
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-tomcat-7.0.70.exe" -OutFile "C:\temp\tomcat7.exe"
Start-Process "C:\temp\tomcat7.exe" -ArgumentList "/S" -Wait