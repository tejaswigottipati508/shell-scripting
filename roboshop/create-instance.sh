#!/bin/bash

component=$1
if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query 'Reservations[*].Instances[*].State.Name')


if [ "$STATE" != "running" ]; then
  aws ec2 run-instances  --launch-template LaunchTemplateId=lt-02b2e635877a68607 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
fi
IPADDRESS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
export component
export IPADDRESS

envsubst <record.json >/tmp/${component}.json

aws route53 change-resource-record-sets --hosted-zone-id Z05871891T73BLRZZ77ZS --change-batch file:///tmp/${component}.json


