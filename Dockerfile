FROM ailispaw/ubuntu-essential:16.04-nodoc

ENV TERM xterm

RUN apt-get -q update && \
    apt-get -q -y install --no-install-recommends build-essential \
      make autoconf automake libtool e2fsprogs check \
      libglib2.0 libyaml-dev libparted-dev libblkid1 libjson-glib-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /ucd

WORKDIR /ucd

RUN sh autogen.sh && \
    make && \
    strip ucd ucd-aws
