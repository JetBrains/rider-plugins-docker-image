# escape=`
FROM microsoft/windowsservercore:ltsc2016
LABEL maintainer="Ivan Pashchenko <ivan.pashchenko@jetbrains.com>"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop') -and $ProgressPreference = 'SilentlyContinue') -and"]

ADD https://chocolatey.org/install.ps1 C:\dependencies\install_choco.ps1
ADD https://dotnetbinaries.blob.core.windows.net/dockerassets/microsoft-windows-netfx3-ltsc2016.zip C:\dependencies\microsoft-windows-netfx3.zip

RUN Set-ExecutionPolicy Bypass -Scope Process -Force) -and `
    (Set-Location C:\dependencies) -and `
    (.\install_choco.ps1) -and `
    (Expand-Archive microsoft-windows-netfx3.zip) -and `
    (Remove-Item -Force microsoft-windows-netfx3.zip) -and `
    (Add-WindowsPackage -Online -PackagePath .\microsoft-windows-netfx3\microsoft-windows-netfx3-ondemand-package.cab) -and `
    (Set-Location C:\) -and `
    (Remove-Item -Force -Recurse C:\dependencies)

RUN (choco install -y git jdk8 visualstudio2017buildtools dotnetcore-sdk netfx-4.6.1-devpack visualstudio2017-workload-netcorebuildtools) -and `
    (Remove-Item -Force -Recurse "${Env:ProgramFiles(x86)}\\Microsoft Visual Studio\\Installer"; `
    Remove-Item -Force -Recurse "${Env:TEMP}\\*"; `
    Remove-Item -Force -Recurse "${Env:ProgramData}\\Package Cache")