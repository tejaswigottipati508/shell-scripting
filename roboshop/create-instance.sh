#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-02b2e635877a68607 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
