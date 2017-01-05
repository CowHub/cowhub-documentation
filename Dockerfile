FROM ubuntu
MAINTAINER Freddie Lindsey freddie.a.lindsey@gmail.com

# Install make
RUN apt-get update && apt-get install -y make

# Install for deployment purposes
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y curl

# Tex and Pandoc
RUN apt-get update && apt-get --no-install-recommends install -y texlive texlive-latex-extra texlive-xetex pandoc
RUN apt-get update && apt-get install -y lmodern

# Installing Python 2.7.11
ENV PATH "/usr/local/bin:$PATH"
RUN apt-get install -y wget autotools-dev blt-dev bzip2 dpkg-dev g++-multilib gcc-multilib libbluetooth-dev libbz2-dev libexpat1-dev libffi-dev libffi6 libffi6-dbg libgdbm-dev libgpm2 libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libtinfo-dev mime-support net-tools netbase python-crypto python-mox3 python-pil python-ply quilt tk-dev zlib1g-dev
RUN wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz && tar -xvf Python-2.7.11.tgz
RUN cd Python-2.7.11 && ./configure --prefix /usr/local/ --enable-ipv6 && make && make install
RUN rm -rf Python-*

# Create documentation
WORKDIR /documentation
CMD ["pandoc", "--variable=geometry:a4paper", "--highlight-style pygments", "--mathjax", "--latex-engine=xelatex", "report.tex", "-o", "report.pdf"]
