# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Maven
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/apache-maven-3.3.9-bin.zip", "C:\temp\maven.zip")
#Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/apache-maven-3.3.9-bin.zip" -OutFile "C:\temp\maven.zip"

# Extract Maven files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\maven.zip")
foreach($item in $zip.items())
{
    $shell.Namespace("C:\").copyhere($item)
}

# Update PATH Environment variable
$Reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
$oldPath=(Get-ItemProperty -Path "$Reg" -Name PATH).Path
$newPath=$oldPath+";C:\apache-maven-3.3.9\bin"
Set-ItemProperty -Path "$Reg" -Name PATH -Value $newPath