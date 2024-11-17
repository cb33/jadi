#!/usr/bin/env bash

# https://www.cyberciti.biz/faq/how-to-find-my-public-ip-address-from-command-line-on-a-linux/

printf "%$(tput cols)s\n"|tr ' ' '-'
ip=$(curl -s http://whatismijnip.nl |cut -d " " -f 5)
echo "IP: ${ip}"
dig -x ${ip} +short

printf "%$(tput cols)s\n"|tr ' ' '-'
echo ifconfig.me
ip=$(curl -sS ifconfig.me)
echo "IP: ${ip}"
dig -x ${ip} +short

printf "%$(tput cols)s\n"|tr ' ' '-'
#curl http://icanhazip.com
echo icanhazip.com
ip=$(curl -sS icanhazip.com)
echo "IP: ${ip}"
dig -x ${ip} +short

printf "%$(tput cols)s\n"|tr ' ' '-'
echo ipecho.net/plain
ip=$(curl -sS ipecho.net/plain)
echo "IP: ${ip}"
dig -x ${ip} +short

printf "%$(tput cols)s\n"|tr ' ' '-'
echo ifconfig.co
ip=$(curl -sS ifconfig.co)
echo "IP: ${ip}"
dig -x ${ip} +short
