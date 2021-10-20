FROM ubuntu:latest

RUN apt-get update -y \
    && apt-get install git -y \
    && apt-get install curl -y \
    && apt-get install unzip -y


WORKDIR /tmp/aws

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
WORKDIR /tmp/aws/aws

RUN ./install

WORKDIR /tmp/kubectl/

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin










