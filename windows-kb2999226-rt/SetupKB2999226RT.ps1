# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Windows8-RT-KB2999226-x64.msu
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/Windows8-RT-KB2999226-x64.msu" -OutFile "c:\temp\KB2999226RT.msu"
Start-Process "C:\temp\KB2999226RT.msu" -ArgumentList "/S /v""/qn""" -Wait