# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Xampp Server
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/xampp-win32-7.0.9-1-VC14-installer.exe" -OutFile "c:\temp\xampp.exe"
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/xampp-win32-7.0.9-1-VC14-installer.exe", "c:\temp\xampp.exe")

# Install Xampp Server
Start-Process "C:\temp\xampp.exe" -ArgumentList "/S /v""/qn""" -Wait