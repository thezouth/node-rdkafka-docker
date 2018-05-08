FROM ubuntu:16.04

# Install NodeJs
RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt install -y nodejs

# Install dependency for librdkafka
RUN apt install -y build-essential

# Working files
WORKDIR /
RUN npm install @types/node@8
RUN npm install node-rdkafka@2.3.1

ARG UID=1000
RUN groupadd -g $UID usergroup
RUN useradd -m -d /workspace -u $UID -g $UID -s /bin/bash user
USER user
WORKDIR /workspace
