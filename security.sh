#!/bin/sh

[ -z "$ssh_port" ] && exit 0
[ -z "$ssh_key" ] && exit 0


# setup SSH
sudo sed -i "s/#Port 22/Port $ssh_port/g" /etc/ssh/sshd_config
sudo sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo printf "\nProtocol 2" | sudo tee /etc/ssh/sshd_config
printf "%s\n" "$ssh_key" > "$HOME/.ssh/authorized_keys"
sudo service sshd restart


# setup UFW
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow "$ssh_port/tcp" comment "SSH"
# sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable
sudo sed -i "s/-A ufw-before-input -p icmp --icmp-type echo-request ACCEPT/-A ufw-before-input -p icmp --icmp-type echo-request DROP/g" /etc/ufw/before.rules
sudo ufw reload
