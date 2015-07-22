#!/bin/bash

echo "Please type the user you wish to restrict to SFTP access only"
read website

usermod -G filetransfer $username
chown root:root /home/$username
chmod 755 /home/$username
