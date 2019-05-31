#!/bin/bash
################################################################################
# Author    : Anibal Enrique Ojeda Gonzalez
# url       : www.nondualit.nl
# Version   : 1.0
# Date      : 30-05-2019
# Description: Add or delete ip from AWS ec2 VPC Security Group firewall 
# More info https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html
################################################################################
aws ec2 describe-security-groups --group-ids | grep GroupName
echo "Enter GroupName: "
read var1

myip=`curl https://ipinfo.io/ip`

while [ -n "$1" ]; do # while loop starts

    case "$1" in
 
    -a)  aws ec2 authorize-security-group-ingress --group-name $var1 --protocol tcp --port 22 --cidr $myip/24 ;; # add option
 
    -d)  aws ec2 revoke-security-group-ingress --group-name $var1 --protocol tcp --port 22 --cidr $myip/24 ;; # del option
    
    -h)  echo "use -a to add your IP address to your AWS ec2 SecurityGroup or -d to delete your IP address from the AWS SecurityGroup" ;; # Help option
 
 
    *) echo "Option $1 not recognized" ;; # In case you typed a different option other than a,d
 
    esac
 
    shift
 
done

aws ec2 describe-security-groups --group-name $var1 | grep 24
