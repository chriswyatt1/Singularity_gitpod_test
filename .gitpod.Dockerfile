FROM gitpod/workspace-full:latest

USER root
# Install util tools.
RUN apt-get update \
 && apt-get install -y
 
 
 # Give back control
USER root

# Cleaning
RUN apt-get clean
