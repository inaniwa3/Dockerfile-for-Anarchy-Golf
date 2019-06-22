FROM i386/debian:wheezy

RUN printf "\
deb http://archive.debian.org/debian wheezy main\n\
deb http://archive.debian.org/debian-security wheezy/updates main" \
    > /etc/apt/sources.list \
 && printf "Acquire::Check-Valid-Until false;" \
    > /etc/apt/apt.conf.d/10nocheckvalid \
 && apt-get update \
 && apt-get install -y \
    git \
    procps \
# instead of `caddy install_apt`
# version info. http://golf.shinh.org/version.rb
    ruby1.8 \
    perl \
    python \
    php5-cli \
    gauche \
    clisp \
    spidermonkey-bin \
    lua5.1 \
    tcl8.4 \
    gnu-smalltalk \
    swi-prolog \
    gforth \
    # yabasic \
    # pugs \
    erlang \
    aplus-fsf \
    gcc \
    g++ \
    ocaml \
    ghc6 \
    gnat \
    gobjc \
    # gcj \
    # gpc \
    gfortran \
    mono-mcs \
    open-cobol \
    mawk \
    sed \
    bash \
    m4 \
    ghostscript \
    # ghdl \
    beef \
    # whitespace \
    # unlambda \
    binutils \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN git clone --depth 1 https://github.com/shinh/caddy.git

WORKDIR /root
