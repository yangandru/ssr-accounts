#!/bin/bash
#autor: gfw-breaker

## ss parameters
ss_port=443
ss_password="gfw-breaker.win"
ss_method="aes-256-cfb"
ss_protocol="auth_sha1_v4_compatible"
ss_obfs="tls1.2_ticket_auth_compatible"
ss_speed=0

## install ss/ssr
yum install -y git epel-release
git clone https://github.com/gfw-breaker/onekey-ssr.git
cd onekey-ssr
chmod +x *.sh
./install.sh

## generate ssr config file
config_file=/etc/shadowsocksr/user-config.json
mkdir /etc/shadowsocksr
ip_addr=$(ifconfig | grep "inet addr" | sed -n 1p | cut -d':' -f2 | cut -d' ' -f1)

cat > $config_file <<EOF
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": $ss_port,
    "local_address": "127.0.0.1",
    "local_port": 1080,

    "password": "$ss_password",
    "method": "$ss_method",
    "protocol": "$ss_protocol",
    "protocol_param": "",
    "obfs": "$ss_obfs",
    "obfs_param": "",
    "speed_limit_per_con": $ss_speed,
    "speed_limit_per_user": 0,

    "additional_ports" : {},
    "timeout": 120,
    "udp_timeout": 60,
    "dns_ipv6": false,
    "connect_verbose_info": 0,
    "redirect": "",
    "fast_open": false
}
EOF

## restart ssr
service ssr restart

## install bbr (optional)
# bash bbr.sh

## disable ipv6 (optional) 
# sed  -i 's/rd_NO_DM/rd_NO_DM ipv6.disable=1/' /boot/grub/grub.conf
# reboot
