# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install WireShark
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/Wireshark-win64-2.2.0.exe", "C:\temp\wireshark.exe")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/Wireshark-win64-2.2.0.exe" -OutFile "c:\temp\wireshark.exe"
Start-Process "C:\temp\wireshark.exe" -ArgumentList "/S /v""/qn""" -Wait