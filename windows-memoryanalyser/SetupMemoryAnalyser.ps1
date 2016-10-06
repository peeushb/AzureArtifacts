# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Memory Analyser
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/MemoryAnalyzer-1.6.0.20160531-win32.win32.x86_64.zip", "C:\temp\memoryanalyser.zip")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/MemoryAnalyzer-1.6.0.20160531-win32.win32.x86_64.zip" -OutFile "c:\temp\memoryanalyser.zip"

# Extract Memory Analyser files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\memoryanalyser.zip")
#New-Item "c:\temp\memoryanalyser" -ItemType Directory -ErrorAction SilentlyContinue
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\temp").Copyhere($item)
}

Start-Process "C:\temp\memoryanalyser\memoryanayser.exe" -ArgumentList "/S /v""/qn""" -Wait
