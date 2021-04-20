#!/bin/bash
path_base='/etc/httpd/conf'

alias cp="cp"
unalias cp

echo -e "\nStart apache ..."
#cp -rf ./apache.conf $path_base/httpd.conf
curl http://169.254.169.254/latest/meta-data/local-ipv4 > /tmp/ip_tmp
sudo cat $path_base/apache.conf_ | perl -ne 's|%LOCAL_IP%|'$(cat /tmp/ip_tmp)'|; print;'> $path_base/httpd.conf
sudo systemctl start httpd
#restart CloudWatchAgent after changes
echo -e "\nrestart CloudWatch Agent after adding apache_log\n"
sudo systemctl restart awslogsd
echo -e "\ncompleted\n"