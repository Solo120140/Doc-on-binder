FROM debian:stable-slim
RUN apt update && apt upgrade && \
    apt install python3 python3-pip python3-jupyterlab python3-notebook-y
RUN python3 -m pip install --no-cache-dir notebook jupyterlab && \
#add the new user with uid 1000

ARG NB_USER=SoLoGotemm
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
#use no password 
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

#echo

RUN echo "Success!"

CMD ["sh", "whoami]
