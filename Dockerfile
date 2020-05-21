# At the time of writing, Ubuntu 18.04 is the most stable Long-Term Support version offered,
# although 20.04 was recently released.
# NOTE: Ubuntu 18.04's code name is bionic
ARG UBUNTU_VERSION=18.04

# Obtain Ubuntu base image
FROM ubuntu:${UBUNTU_VERSION}
RUN apt-get update && \
	apt-get -qq install apt-utils software-properties-common

# Install texlive for LaTeX processing
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install \
	apt-transport-https software-properties-common \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install \
		curl \
		texlive-full

WORKDIR /home

# Pull in a more recent release of ACM's article template
# At the time of writing it included some bug fixes that were useful,
# and this most recent version wasn't available in the base texlive-full version
# that was installed in the apt repository
RUN curl -L \
	https://api.github.com/repos/borisveytsman/acmart/tarball/v1.71 \
	| tar xz \
	&& cd borisveytsman-acmart-3f3fcb9 \
	&& latex acmart.ins \
	&& mkdir -p /home/src/ \
	&& cp acmart.cls /home/src/

COPY run /home/run

ENTRYPOINT ["/home/run"]
