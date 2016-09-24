# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/SQLServer_11.0_Full.zip" -OutFile "C:\temp\SQLServer_11.0_Full.zip"

# Extract SQL Server files to new folder
$shell = New-Object -com shell.application
$zip = $shell.NameSpace("C:\temp\SQLServer_11.0_Full.zip")
New-Item "c:\temp\SQLServer_11.0_Full" -ItemType Directory -ErrorAction SilentlyContinue
Foreach($item In $zip.items())
{
    $shell.Namespace("C:\temp\SQLServer_11.0_Full").Copyhere($item)
}

# Get Machine name
$VMName = hostname
$INSTANCENAME = $VMName.replace("-","").ToUpper()
$SQLSVCACCOUNT = $VMName + "\LabAdmin" 
$SQLSVCPASSWORD = "Welcome123!"
$SQLSYSADMINACCOUNTS = $SQLSVCACCOUNT 

$ArgumentList = "/q /ACTION=Install QUIET=True /FEATURES=SQLENGINE /SQLSVCACCOUNT=" + $SQLSVCACCOUNT + " /SQLSVCPASSWORD=" + 
    $SQLSVCPASSWORD + " /SQLSYSADMINACCOUNTS=" + $SQLSYSADMINACCOUNTS + " /AGTSVCACCOUNT=""NT AUTHORITY\Network Service"" /IACCEPTSQLSERVERLICENSETERMS /AGTSVCSTARTUPTYPE=Automatic /SQLSVCSTARTUPTYPE=Automatic"

# Install MS SQL Server
Start-Process "C:\temp\SQLServer_11.0_Full\setup.exe" -ArgumentList $ArgumentList -Wait

# Create a Shortcut for SQL Server Management Studio with Windows PowerShell
$TargetFile = "C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe"
$ShortcutFile = "$env:Public\Desktop\SQL Server Management Studio.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()