# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Get Machine name
$VMName = hostname
$INSTANCENAME = $VMName.replace("-","").ToUpper()
$SQLSVCACCOUNT = $VMName + "\LabAdmin" 
$SQLSVCPASSWORD = "Welcome123!"
$SQLSYSADMINACCOUNTS = $SQLSVCACCOUNT 

$ArgumentList = "/q /ACTION=Install QUIET=True /FEATURES=SQLENGINE /INSTANCENAME=" + $INSTANCENAME + " /SQLSVCACCOUNT=" + $SQLSVCACCOUNT + " /SQLSVCPASSWORD=" + 
    $SQLSVCPASSWORD + " /SQLSYSADMINACCOUNTS=" + $SQLSYSADMINACCOUNTS + " /AGTSVCACCOUNT=""NT AUTHORITY\Network Service"" /IACCEPTSQLSERVERLICENSETERMS /AGTSVCSTARTUPTYPE=Automatic /SQLSVCSTARTUPTYPE=Automatic"

# Install MS SQL Server
Start-Process "C:\Program Files (x86)\MSSQLServer\Setup.exe" -ArgumentList $ArgumentList -Wait