# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install WireShark
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/Thinfinity_Remote_Desktop_Workstation_Setup_x64.exe" -OutFile "c:\temp\wireshark.exe"
Start-Process "C:\temp\wireshark.exe" -ArgumentList "/S /v""/qn""" -Wait