FROM gitpod/workspace-full:latest

USER gitpod

RUN brew install dep

# Install util tools.
RUN RUN apt-get update \ && 
    apt-get install -y \ && 
    apt-utils \ && 
    sudo \ && 
    git \ && 
    less \ && 
    wget

# Install singularity dependencies.
RUN sudo apt-get update \ && 
    sudo apt-get install -y \ &&
    build-essential \ &&
    libssl-dev \ &&
    uuid-dev \ &&
    libgpgme11-dev \ &&
    squashfs-tools \ &&
    libseccomp-dev \ &&
    pkg-config
 
# Install Singularity (Go is already installed)
RUN export VERSION=3.0.3 && # adjust this as necessary \
    mkdir -p $GOPATH/src/github.com/sylabs && \
    cd $GOPATH/src/github.com/sylabs && \
    wget https://github.com/sylabs/singularity/releases/download/v3.0.3/singularity-3.0.3.tar.gz && \
    tar -xzf singularity-3.0.3.tar.gz && \
    cd ./singularity && \
    ./mconfig --prefix=/usr/local && \
    make -C ./builddir && \
    sudo make -C ./builddir install
    


RUN echo ". /usr/local/etc/bash_completion.d/singularity" >> ${HOME}/.bashrc

 
 # Give back control
USER root

# Cleaning
RUN sudo apt-get clean
