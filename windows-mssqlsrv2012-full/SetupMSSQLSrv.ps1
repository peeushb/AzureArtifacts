# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/SQLServer_11.0_Full" -OutFile "C:\temp\SQLServer_11.0_Full"

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