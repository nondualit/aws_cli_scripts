#!/bin/bash
################################################################################
# Author    : Anibal Ojeda
# Version   : 1.0
# Date      : 29-05-2019
# Description: Add or delete ip from AWS firewall 
# More info https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html
################################################################################
aws ec2 describe-security-groups --group-ids | grep GroupName
echo "Enter GroupName: "
read var1

myip=`curl https://ipinfo.io/ip`

aws ec2 authorize-security-group-ingress --group-name $var1 --protocol tcp --port 22 --cidr $myip/24

aws ec2 describe-security-groups --group-name $var1 | grep 24
