FROM ubuntu:18.04
LABEL maintainer="Ivan Pashchenko <ivan.pashchenko@jetbrains.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
	cmake \
	clang \
	make \
	git \
	ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates


