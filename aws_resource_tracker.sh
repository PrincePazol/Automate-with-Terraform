#!/bin/bash

##################################
# Author: PrincePazol
# Date: 03/17/2024
# 
# Version: v1
# 
# This script will report the AWS resource usage
##################################

set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls > resourceTracker

# list ec2 instances
echo "Print list of ec2"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list lambda
echo "Print list of lambda functions"
aws lambda list-functions

# list IAM Users
echo "Print list of IAM Users"
aws iam list-users
