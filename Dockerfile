# Use sqlmap in a docker container
FROM debian:jessie
MAINTAINER Timo Furrer <tuxtimo@gmail.com>

# set dpkg to non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# the version of sqlmap to use
ENV SQLMAP_VERSION 1.0.11

# install git to clone sqlmap
RUN apt-get update
RUN apt-get install -y --no-install-recommends git ca-certificates python

# add user which will run sqlmap
RUN useradd -m sqlmapper
USER sqlmapper
WORKDIR /home/sqlmapper

# clone sqlmap and checkout correct version
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap
WORKDIR /home/sqlmapper/sqlmap
RUN git checkout ${SQLMAP_VERSION}

# specify directory where sqlmap results can be placed
VOLUME /results

CMD ["--help"]
ENTRYPOINT ["./sqlmap.py"]
