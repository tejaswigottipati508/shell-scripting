#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend" --query 'Reservations[*].Instances[*].State.Name' --OUTPUT TEXT)

if [ STATE != "running" ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=lt-08658ca63d7181d6b --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=${component}}]"
fi

$ aws route53 change-resource-record-sets --hosted-zone-id --change-batch file://sample.json