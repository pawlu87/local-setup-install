#!/bin/bash

if [[ $(command -v ansible) == "" ]]; then
	echo "installing ansible"
	sudo apt-get install ansible
fi

if [[ $(command -v openssh-server) == "" ]]; then
	echo "installing openssh-server"
	sudo apt-get install openssh-server
fi

if [[ ! -f ~/.ssh/id_rsa ]]; then
	echo "- adding id_rsa"
	ssh-keygen
fi

if [[ ! -f ~/.ssh/authorized_keys ]]; then
	echo "- adding authorized key"
	ssh-copy-id $(whoami)@localhost
fi

ansible-playbook -K playbook.yml
