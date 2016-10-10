# Create temp directory
New-Item "c:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Acrobat Reader
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/react-15.3.2.zip" -OutFile "c:\temp\reactjs.zip"
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/react-15.3.2.zip", "c:\temp\reactjs.zip")

# Extract ReactJS files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\reactjs.zip")
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\").Copyhere($item)
}