FROM openjdk:8u181-jdk-slim-stretch
LABEL maintainer="Ivan Pashchenko <ivan.pashchenko@jetbrains.com>"

# that's for azure plugin right now, probably should be move to separate dockerfie or build stge
RUN apt-get update && apt-get install -y --no-install-recommends \
        maven \
        openjfx \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        mc \
        git \
	&& rm -rf /var/lib/apt/lists/*