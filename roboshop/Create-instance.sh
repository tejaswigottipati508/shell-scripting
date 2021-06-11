#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

 aws ec2 run-instances --launch-template LaunchTemplateId=lt-08658ca63d7181d6b --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=${component}}]"