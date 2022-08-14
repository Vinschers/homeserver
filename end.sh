#!/bin/sh

echo -n "Press enter to continue..."
read dummy

# 2FA on SSH
sudo apt install libpam-google-authenticator
google-authenticator
sudo sed -i "s/@include common-auth/#@include common-auth/g" /etc/pam.d/sshd
printf "\nauth required pam_google_authenticator.so" | sudo tee /etc/pam.d/sshd
sudo sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
sudo sed -i "/UsePAM yes/a AuthenticationMethods publickey,password publickey,keyboard-interactive" /etc/ssh/sshd_config
sudo service sshd restart
