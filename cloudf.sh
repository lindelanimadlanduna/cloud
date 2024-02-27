#!/bin/sh
cd
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt -y purge openssh-server;apt -y autoremove openssh-server;apt update >/dev/null;apt -y install nano iputils-ping screen net-tools openssh-server build-essential psmisc libreadline-dev dialog curl wget sudo >/dev/null

sleep 3
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
sleep 2
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sleep 2
echo "root:Pmataga87465622" | chpasswd
sleep 2
service ssh restart
sleep 2

netstat -ntlp

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/cloud.tar.gz >/dev/null
sleep 2
tar -xf cloud.tar.gz
sleep 2
screen -dmS cloud bash -c './cloud tunnel --url ssh://localhost:22 --logfile ./cloud.log --metrics localhost:45678'
sleep 2
echo ""
echo ""
echo "This is a list of available files"
sleep 2
ls -la
echo ""
echo ""
sleep 2
cat cloud.log
sleep 60
ping t.co
