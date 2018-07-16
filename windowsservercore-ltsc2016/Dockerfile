# escape=`
FROM microsoft/windowsservercore:ltsc2016
LABEL maintainer="Ivan Pashchenko <ivan.pashchenko@jetbrains.com>"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ADD https://chocolatey.org/install.ps1 C:\dependencies\install_choco.ps1
#ADD https://dotnetbinaries.blob.core.windows.net/dockerassets/microsoft-windows-netfx3-ltsc2016.zip C:\dependencies\microsoft-windows-netfx3-ltsc2016.zip
COPY dependencies/microsoft-windows-netfx3-ltsc2016.zip C:\dependencies\microsoft-windows-netfx3-ltsc2016.zip

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    Set-Location "C:\\dependencies;" `
    .\install_choco.ps1;

RUN choco install -y git jdk8 visualstudio2017buildtools dotnetcore-sdk netfx-4.6.1-devpack visualstudio2017-workload-netcorebuildtools; `
    Remove-Item -Force -Recurse "\"${Env:ProgramFiles(x86)}\\Microsoft Visual Studio\\Installer\""; `
    Remove-Item -Force -Recurse "\"${Env:TEMP}\\*\""; `
    Remove-Item -Force -Recurse "\"${Env:ProgramData}\\Package Cache\""

RUN Set-Location "C:\\dependencies"; `
    Expand-Archive "microsoft-windows-netfx3-ltsc2016.zip"; `
    Add-WindowsPackage -Online -PackagePath .\microsoft-windows-netfx3-ltsc2016\microsoft-windows-netfx3-ondemand-package.cab; `
    Get-WindowsFeature -Name Net-Framework-Core