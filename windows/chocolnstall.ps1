Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git
choco install -y googlechrome
choco install -y firefox
choco install -y visualstudiocode
choco install -y 7zip
choco install -y nvm
choco install -y winmerge
choco install -y winscp
choco install -y teraterm
choco install -y keepass
choco install -y lightshot
choco install -y gimp
choco install -y android-sdk
choco install -y androidstudio
choco list -lo
