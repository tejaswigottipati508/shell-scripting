#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

aws ec2 run-instances  --launch-template LaunchTemplateId=lt-099427d36c7013440 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"