FROM gitpod/workspace-full:latest

USER gitpod

RUN brew install dep

# Install util tools.
RUN sudo apt-get update \
 && sudo apt-get install -y
 
 
 # Give back control
USER root

# Cleaning
RUN sudo apt-get clean
