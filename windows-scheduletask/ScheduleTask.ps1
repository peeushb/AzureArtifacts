# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
(New-Object System.Net.WebClient).DownloadFile("https://spvlabtemplates.blob.core.windows.net/software/Auto-shutdownon-on-disconnect.xml", "C:\temp\Auto-shutdownon-on-disconnect.xml")

# Import task
$xmlfile = "C:\temp\Auto-shutdownon-on-disconnect.xml"
$UserName = "$env:COMPUTERNAME\" + "LabAdmin"
schtasks /Create /XML $xmlfile /RU $UserName /RP "Welcome123!" /TN "Auto shutdown on disconnect"