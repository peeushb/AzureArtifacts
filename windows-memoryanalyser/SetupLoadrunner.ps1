# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Memory Analyser
Invoke-WebRequest "https://thinrdpx.blob.core.windows.net/extension/MemoryAnalyzer-1.6.0.20160531-win32.win32.x86_64.zip" -OutFile "c:\temp\memoryanayser.zip"

# Extract Memory Anakyser files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\memoryanalyser.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}

Start-Process "C:\temp\memoryanayser.exe" -ArgumentList "/S /v""/qn""" -Wait

