FROM ubuntu:latest

RUN apt-get update -y \
    && apt-get install git -y \
    && apt-get install curl -y \
    && apt-get install unzip -y


WORKDIR /tmp/aws

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -f awscliv2.zip
WORKDIR /tmp/aws/aws

RUN ./install --update

WORKDIR /tmp/kubectl/

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin

WORKDIR /tmp/helm/

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod +x get_helm.sh
RUN ./get_helm.sh


WORKDIR /tmp/kops/

RUN curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
RUN mv kops-linux-amd64 kops
RUN chmod +x kops
RUN mv kops /usr/local/bin

WORKDIR /app








