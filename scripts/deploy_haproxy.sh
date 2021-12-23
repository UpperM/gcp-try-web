#!/bin/bash
cfgpath="/etc/haproxy"
sudo apt update -y
sudo apt install haproxy -y
sudo mv $cfgpath/haproxy.cfg $cfgpath/haproxy.cfg.bak
sudo curl https://raw.githubusercontent.com/UpperM/gcp-try-web/main/config/haproxy.cfg --output $cfgpath/haproxy.cfg
sudo systemctl restart haproxy
