# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install KB2999226
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/Windows8.1-KB2999226-x64.msu", "C:\temp\KB2999226.msu")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/Windows8.1-KB2999226-x64.msu" -OutFile "c:\temp\KB2999226.msu"
Start-Process "C:\temp\KB2999226.msu" -ArgumentList "/S /v""/qn""" -Wait