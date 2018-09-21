FROM openjdk:8u181-jdk-slim-stretch
LABEL maintainer="Ivan Pashchenko <ivan.pashchenko@jetbrains.com>"

# deps for custom apt lists
RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    apt-transport-https \
# ms list
    wget \
    gpg \
# mono list
    dirmngr \
&& apt-get clean all

# dotnet-sdk-2.1
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
&& mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
&& wget -q https://packages.microsoft.com/config/debian/9/prod.list \
&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
&& chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
&& chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
&& apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    dotnet-sdk-2.1 \
&& apt-get clean all

# mono
ENV RIDER_BUILD_MONO_VERSION=5.14.0.177-0xamarin3+debian9b1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
&& echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
&& apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    mono-complete=$RIDER_BUILD_MONO_VERSION \
    mono-dbg=$RIDER_BUILD_MONO_VERSION \
    mono-runtime-dbg=$RIDER_BUILD_MONO_VERSION \
    referenceassemblies-pcl \
    msbuild \
&& apt-get clean all

# # debug build
# RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
#         git \
#         mc \
# 	&& apt-get clean all

# RUN git clone https://github.com/JetBrains/resharper-unity.git