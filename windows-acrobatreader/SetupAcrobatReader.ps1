# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Acrobat Reader
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/AdbeRdr11000_mui_Std.zip" -OutFile "c:\temp\AdbeRdr11.zip"
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/AdbeRdr11000_mui_Std.zip", "c:\temp\AdbeRdr11.zip")

# Extract Acrobat Reader files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\AdbeRdr11.zip")
#New-Item "c:\temp\adobeReader11" -ItemType Directory -ErrorAction SilentlyContinue
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\temp").Copyhere($item)
}

# Install Adobe Acrobat Reader
Start-Process "C:\temp\adobeReader11\AdbeRdr11.exe" -ArgumentList "/S /v""/qn""" -Wait