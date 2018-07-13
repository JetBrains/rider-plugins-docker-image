# escape=`
FROM microsoft/windowsservercore:ltsc2016

ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\temp\vs_buildtools.exe

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install -y git jdk8 visualstudio2017buildtools dotnetcore-sdk