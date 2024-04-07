#!/bin/bash

##this is for ubuntu
###this helps you install UFs on linux###

wget -O /tmp/splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz 'https://download.splunk.com/products/universalforwarder/releases/8.2.3/linux/splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz'

tar xf /tmp/splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz -C /opt

sudo echo -e "[user_info]\nUSERNAME = admin\nPASSWORD = qwerty123" > /opt/splunkforwarder/etc/system/local/user-seed.conf

sudo /opt/splunkforwarder/bin/splunk enable boot-start -user root --accept-license --answer-yes --no-prompt


/opt/splunkforwarder/bin/splunk restart
