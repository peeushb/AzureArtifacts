# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Loadrunner
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/AdbeRdr11000_mui_Std.zip" -OutFile "c:\temp\AdbeRdr11.zip"

# Extract Acrobat Reader files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\AdbeRdr11.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

Start-Process "C:\temp\AdbeRdr11.exe" -ArgumentList "/S /v""/qn""" -Wait

