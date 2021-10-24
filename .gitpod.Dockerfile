FROM gitpod/workspace-full:latest

USER gitpod

RUN brew install dep

# Install util tools.
RUN apt-get update \
 && apt-get install -y
 
 
 # Give back control
USER root

# Cleaning
RUN apt-get clean
