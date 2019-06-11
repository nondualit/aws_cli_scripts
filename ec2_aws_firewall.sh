#!/bin/bash
#set -x
################################################################################
# Author    : Anibal Enrique Ojeda Gonzalez
# url       : www.nondualit.nl
# Version   : 2.0
# Date      : 30-05-2019
# Description: Add or delete ip from AWS ec2 VPC Security Group firewall 
# More info https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html
################################################################################


# Options
while [ -n "$1" ]; do # while loop starts

    case "$1" in
 

    -a)  
      aws ec2 describe-security-groups --group-ids | grep GroupName
      echo  "Enter GroupName: "
      read var1
      echo  "Enter port number: "
      read var2
      myip=`curl https://ipinfo.io/ip`
      aws ec2 authorize-security-group-ingress --group-name $var1 --protocol tcp --port $var2 --cidr $myip/24 
     
     ;; # add option

    -d)  
      aws ec2 describe-security-groups --group-ids | grep GroupName
      echo  "Enter GroupName: "
      read var1
      echo  "Enter port number: "
      read var2
      myip=`curl https://ipinfo.io/ip`
      aws ec2 revoke-security-group-ingress --group-name $var1 --protocol tcp --port $var2 --cidr $myip/24 ;; # del option
    
    -h)  echo "use -a to add your IP address to your AWS ec2 SecurityGroup, -s to show IP address or -d to delete your IP address from the AWS SecurityGroup" ;; # Help option

    -s)  aws ec2 describe-security-groups --group-name $var1 | grep 24 ;; # show ip 

     *) echo "Option $1 not recognized. Use -h for help" ;; # In case you typed a different option other than a,d,h
 
    esac
 
    shift
 
done
