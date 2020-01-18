#!/bin/bash

if [ $(command -v ansible) != "/usr/bin/ansible" ]; then
	sudo apt-get install ansible
fi

if [[ -f "~/.ssh/id_rsa" ]]; then
	ssh-keygen
fi

if [[ -f "~/.ssh/authorized_keys" ]]; then
	ssh-copy-id $(whoami)@localhost
fi

ansible-playbook -K playbook.yml
