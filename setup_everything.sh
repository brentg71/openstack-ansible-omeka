#!/bin/bash

# Script variables
###
### NOTE: requires the apg package (installed via Heat Template)
###
PASSWD_GEN_CMD="apg -c cl_seed -n 1 -m 20 -M NC"

# Generate random passwords for MySQL accounts
MYSQL_ROOT_PASSWORD=`${PASSWD_GEN_CMD}`
MYSQL_OMEKA_PASSWORD=`${PASSWD_GEN_CMD}`

# Install requisite Ansible Galaxy roles
ansible-galaxy install -r requirements.yml

# Run the default playbook
ansible-playbook ./site.yml --extra-vars "mysql_root_password=$MYSQL_ROOT_PASSWORD omeka_password=$MYSQL_OMEKA_PASSWORD"
