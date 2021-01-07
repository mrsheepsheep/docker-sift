FROM ubuntu:18.04

# Update
RUN apt-get -qq update && \
	apt-get install -yq curl wget gnupg2 sudo nano git

# Create user
RUN useradd investigator -m
RUN addgroup investigator sudo
RUN echo "investigator ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Download sift installation scripts v1.9.2
RUN curl -Lo /usr/local/bin/sift \
	https://github.com/sans-dfir/sift-cli/releases/download/v1.9.2/sift-cli-linux

RUN chmod +x /usr/local/bin/sift


# Install sift
USER investigator
RUN sudo sift install --mode=server --user=investigator

# Install volatility3 as 'vol3'
USER root
WORKDIR /opt
# Python3 should already be installed
RUN apt install -yq python3
RUN git clone https://github.com/volatilityfoundation/volatility3.git
RUN ln -s /opt/volatility3/vol.py /usr/local/bin/vol3

USER investigator
WORKDIR /home/investigator
