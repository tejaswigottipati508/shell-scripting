#!/bin/bash

COMPONENT=frontend

source components/common.sh

netstat -tn 2>/dev/null
grep :80
awk '{print $5}'
cut -d: -f1
sort | uniq -c | sort -nr