# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Office365
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/Setup.X86.en-US_O365HomePremRetail_050946c1-e3b9-4b2d-9b4f-f519e0f0ce79_TX_SG_.exe" -OutFile "c:\temp\office365.zip"

# Extract Office365 files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\office365.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

Start-Process "C:\temp\setup.exe" -ArgumentList "/S /v""/qn""" -Wait

