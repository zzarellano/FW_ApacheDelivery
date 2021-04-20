#!/bin/bash
path_base='/etc/httpd/conf'
now=$(date +"%Y%m%d-%H%M")

alias cp="cp"
unalias cp

echo -e "\nBackup old apache conf ..."
sudo mv $path_base/httpd.conf $path_base/httpd.conf_$now
echo -e "\ncompleted\n"