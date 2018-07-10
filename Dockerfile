FROM microsoft/dotnet:2.1-sdk-bionic
MAINTAINER Ivan Pashchenko <ivan.pashchenko@jetbrains.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive MONO_VERSION=5.12.0.226-0xamarin3+ubuntu1804b1 apt-get -y install mono-complete=$MONO_VERSION mono-dbg=$MONO_VERSION mono-runtime-dbg=$MONO_VERSION \
referenceassemblies-pcl msbuild openjdk-8-jdk && apt-get clean all
