FROM debian:jessie

RUN apt-get update
RUN apt-get install -y curl git
RUN mkdir /src

WORKDIR /src
RUN git clone --recursive https://github.com/ceph/ceph

WORKDIR /src/ceph
RUN ./install-deps.sh

RUN git checkout -b v10.0.4 v10.0.4 

# RUN ./autogen.sh
# RUN ./configure
# RUN make 
# RUN make install

COPY changelog /src/ceph/debian/
RUN dpkg-buildpackage


