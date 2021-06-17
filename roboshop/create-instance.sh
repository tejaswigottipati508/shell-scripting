#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query 'Reservations[*].Instances[*].State.Name' --output text)

if [ "$STATE" != "running" ]; then
  aws ec2 run-instances  --launch-template LaunchTemplateId=lt-0c43aaeb0e08199e0 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]" | jq .
  sleep 15
fi

IPADDRESS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
export component
export IPADDRESS

envsubst <record.json >/tmp/${component}.json

aws route53 change-resource-record-sets --hosted-zone-id Z076258917LZOFQ2TZ491 --change-batch file:///tmp/${component}.json



