#!/bin/bash
##############################################
# Author: PrincePazol
# Date: 03/17/2024
# Purpose: A script to print AWS related resources
##############################################
#
set -x # debugging mode
set -e # exits script if an error occurs
set -o pipefail # do not execute error pipes
#
# list aws ec2 instances
echo "LIST OF EC2 INSTANCES" 
echo $'\t'"EC2 Specifications" > results.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].ImageId' >> results.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceType' >> results.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].PublicIpAddress' >> results.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> results.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].State.Name' >> results.txt


# list aws s3 buckets
echo "LIST OF s3 buckets"
aws s3 ls 

# list aws IAM Users
echo "LIST OF IAM USERS"
echo "IAM Users" >> results.txt
aws iam list-users | jq '.Users[].UserName' >> results.txt
