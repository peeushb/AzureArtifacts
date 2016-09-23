# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install KB2999226
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/Windows8.1-KB2999226-x64.msu" -OutFile "c:\temp\KB2999226.msu"
Start-Process "C:\temp\KB2999226.msu" -ArgumentList "/S /v""/qn""" -Wait