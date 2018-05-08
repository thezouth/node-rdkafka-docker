#!/bin/bash
set -e

: ${NODE_VERSION:=8}
: ${NODE_RDKAFKA_VERSION:=2.3.1}

IMAGE_NAME="webscal3r/node-rdkafka"

sed -i'.bak' "s/^\(RUN npm install @types\/node\)@.*/\1@${NODE_VERSION}/" Dockerfile
sed -i'.bak' "s/^\(RUN npm install node-rdkafka\)@.*/\1@${NODE_RDKAFKA_VERSION}/" Dockerfile
#docker image build --build-arg UID=`id -u` --network=host -t ${IMAGE_NAME}:${NODE_RDKAFKA_VERSION} .
#docker push ${IMAGE_NAME}:${NODE_VERSION}-${NODE_RDKAFKA_VERSION}
