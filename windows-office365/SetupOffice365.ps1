# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Office365
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/Setup.X86.en-US_O365HomePremRetail_050946c1-e3b9-4b2d-9b4f-f519e0f0ce79_TX_SG_.exe", "C:\temp\office365.exe")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/Setup.X86.en-US_O365HomePremRetail_050946c1-e3b9-4b2d-9b4f-f519e0f0ce79_TX_SG_.exe" -OutFile "c:\temp\office365.exe"
Start-Process "C:\temp\office365.exe" -ArgumentList "/S /v""/qn""" -Wait