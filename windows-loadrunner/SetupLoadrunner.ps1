# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Loadrunner
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/HPE_LoadRunner_12.53_Community_Edition_HPLR_1253_Community_Edition.zip", "C:\temp\loadrunner.zip")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/HPE_LoadRunner_12.53_Community_Edition_HPLR_1253_Community_Edition.zip" -OutFile "c:\temp\loadrunner.zip"

# Extract Loadrunner files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\loadrunner.zip")
#New-Item "c:\temp\loadrunner" -ItemType Directory -ErrorAction SilentlyContinue
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\temp").Copyhere($item)
}

Start-Process "C:\temp\loadrunner\loadrunner.exe" -ArgumentList "/S /v""/qn""" -Wait

