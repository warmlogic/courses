#!/bin/bash
#
# Configure a t2.large instance

# get the correct ami
# https://cloud-images.ubuntu.com/locator/ec2/
# export region=$(aws configure get region)
# if [ $region = "us-west-2" ]; then
#    export ami="ami-f8fd5998" # Oregon
# elif [ $region = "eu-west-1" ]; then
#    export ami="ami-9e1a35ed" # Ireland
# elif [ $region = "us-east-1" ]; then
#   export ami="ami-9c5b438b" # Virginia
# else
#   echo "Only us-west-2 (Oregon), eu-west-1 (Ireland), and us-east-1 (Virginia) are currently supported"
#   exit 1
# fi

# https://gist.github.com/vancluever/7676b4dafa97826ef0e9
export ami=`aws ec2 describe-images \
    --owners 099720109477 \
    --filters Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-* \
    --query 'sort_by(Images,&CreationDate)[-1].ImageId'`

export instanceType="t2.large"

. $(dirname "$0")/setup_instance.sh $1
