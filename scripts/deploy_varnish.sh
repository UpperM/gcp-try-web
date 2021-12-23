#!/bin/bash
cfgpath="/etc/varnish"
sudo apt update -y
sudo apt install varnish -y
sudo mv $cfgpath/default.vcl $cfgpath/default.vcl.bak
sudo curl https://raw.githubusercontent.com/UpperM/gcp-try-web/main/config/default.vcl --output $cfgpath/default.vcl
sudo systemctl restart varnish
