## Dockerfile for building a docker imapsync image

#  docker build -t amitdalal/imapsync . 
#
# where this Dockerfile is in the current directory



FROM debian:stretch 

LABEL   maintainer="https://github.com/amitsdalal" \
        description="imapsync" \
        documentation="https://github.com/amitsdalal/imapsync/wiki"

# Put a copy of the Dockerfile in the image itself
# It can help future maintenance, isn't it?

# Also put my local imapsync on / for testing purpose
# (stupid since erased by the wget below)

RUN set -xe && \
  apt-get update \
  && apt-get install -y \
  libauthen-ntlm-perl \
  libcgi-pm-perl \
  libcrypt-openssl-rsa-perl \
  libdata-uniqid-perl \
  libfile-copy-recursive-perl \
  libfile-tail-perl        \
  libio-socket-ssl-perl \
  libio-socket-inet6-perl \
  libio-tee-perl \
  libhtml-parser-perl \
  libjson-webtoken-perl \
  libmail-imapclient-perl \
  libparse-recdescent-perl \
  libmodule-scandeps-perl \
  libpar-packer-perl \
  libreadonly-perl \
  libregexp-common-perl \
  libsys-meminfo-perl \
  libterm-readkey-perl \
  libtest-mockobject-perl \
  libtest-pod-perl \
  libunicode-string-perl \
  liburi-perl  \
  libwww-perl \
  procps \
  wget \
  make \
  cpanminus \
  lsof \
  && rm -rf /var/lib/apt/lists/*

RUN set -xe && \
  pwd \
  && wget -N https://raw.githubusercontent.com/amitsdalal/imapsync/master/imapsync \
  && cp imapsync /usr/bin/imapsync \
  && chmod +x /usr/bin/imapsync 

USER nobody:nogroup

ENV HOME /var/tmp/

WORKDIR /var/tmp/

STOPSIGNAL SIGINT

CMD ["/usr/bin/imapsync"]

# 
# End of imapsync Dockerfile 