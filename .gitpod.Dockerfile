FROM gitpod/workspace-full:latest

USER root
# Install util tools.
RUN apt-get update \
 && apt-get install -y \
  apt-utils \
  sudo \
  git \
  less \
  wget
  
# Install Singularity (Go is already installed)
RUN wget https://github.com/sylabs/singularity/releases/download/v3.8.1/singularity-ce-3.8.1.tar.gz && \
    tar -xzf singularity-ce-3.8.1.tar.gz && \
    cd singularity-ce-3.8.1 && \
    ./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install
    
RUN cd && rm -rf singularity-ce-3.8.*  

RUN echo ". /usr/local/etc/bash_completion.d/singularity" >> ${HOME}/.bashrc

# Give back control
USER root

# Cleaning
RUN apt-get clean  
