#!/bin/bash

# Install Ansible Galaxy roles
ansible-galaxy install -r requirements.yml

# Run the default playbook
ansible-playbook ./site.yml 
