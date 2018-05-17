#!/bin/bash

# Configure an AWS EC2 instance

# get the correct ami
# https://gist.github.com/vancluever/7676b4dafa97826ef0e9
export ami=`aws ec2 describe-images \
    --owners 099720109477 \
    --filters Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-* \
    --query 'sort_by(Images,&CreationDate)[-1].ImageId'`

export instanceType="$1"

. $(dirname "$0")/setup_instance.sh $2
