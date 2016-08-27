# Create temp directory
New-Item "C:\temp" -ItemType Directory -ErrorAction SilentlyContinue

# Download and install Mysql installer
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/mysql-installer-community-5.7.14.0.msi" -OutFile "c:\temp\mysql.msi"
Start-Process 'msiexec' -ArgumentList '/i "C:\temp\mysql.msi" /quiet /log C:\temp\mysql-install.log' -Wait

# Download and install pre-requisite software
Invoke-WebRequest "https://spvlabtemplates.blob.core.windows.net/software/vcredist_x64.exe" -OutFile "c:\temp\vcredist.exe"
Start-Process "C:\temp\vcredist.exe" -ArgumentList "/S" -Wait

# Install Mysql products
Start-Process "C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySQLInstallerConsole.exe" -ArgumentList "install -type=Full -silent" -Wait
Start-Process "C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySQLInstallerConsole.exe" -ArgumentList "configure server:rootpasswd=password;servicename=MySQL -silent" -Wait

# Grant all permission to root
Start-Process "C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql -u root -ppassword -e ""grant all privileges on *.* to root@'localhost'""";