FROM archlinux/archlinux:latest

# Helper scripts
WORKDIR /temp
COPY install.sh /temp
RUN chmod +x ./install.sh

# Sync repositories update and archlinux packages
RUN ./install.sh -yu

# Setup build user
RUN ./install.sh sudo
RUN useradd -m --shell=/bin/sh build && usermod -L build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN chmod 777 -R /temp
USER build

# Install yay
RUN ./install.sh base-devel git
RUN git clone https://aur.archlinux.org/yay.git /temp/yay
RUN cd /temp/yay && makepkg --noconfirm -si

# Install mingw core and mingw-get
RUN ./install.sh mingw-w64
RUN ./install.sh mingw-w64-tools

ENTRYPOINT [ "/bin/bash" ]