#!/bin/bash

component=$1case $x in
if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-lt-005d5ab8348b23745 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
