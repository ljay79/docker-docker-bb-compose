FROM docker:stable

LABEL maintainer="Jens Rosemier" \
      version="1.0" \
      description="Bitbucket Pipeline image with boto3 and docker-compose dependencies"

RUN apk update && apk upgrade

# Add python pip and bash
RUN apk add --no-cache python python-dev py-pip build-base libffi-dev openssl-dev libgcc py-pip bash

# Install docker-compose via pip
RUN pip install --no-cache-dir docker-compose \
	&& docker-compose -v

# Add jq, awscli and boto3
# latest: jq v3.8.0, aws-cli v1.16, boto3 v1.9.117
 
RUN apk add --no-cache jq \
	&& jq --version

# aws-cli/1.16
RUN pip install --no-cache-dir awscli \
	&& aws --version

# boto3 v1.9.117
RUN pip install --no-cache-dir boto3

# Install git
RUN apk add git
