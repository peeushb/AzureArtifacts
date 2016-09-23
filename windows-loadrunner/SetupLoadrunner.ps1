# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Loadrunner
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/HPE_LoadRunner_12.53_Community_Edition_HPLR_1253_Community_Edition.zip" -OutFile "c:\temp\loadrunner.zip"

# Extract Loadrunner files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\loadrunner.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

Start-Process "C:\temp\loadrunner.exe" -ArgumentList "/S /v""/qn""" -Wait

