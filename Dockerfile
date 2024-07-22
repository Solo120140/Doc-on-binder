# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget

RUN wget https://cdn.organichits.co/download/organichits-2.1.6-linux.zip

# Install Jupyter and other necessary packages
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install notebook jupyterhub jupyterlab

# Expose port for Jupyter Notebook
EXPOSE 8888

# Set the default command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
