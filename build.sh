#!/usr/bin/env bash

PROGNAME=$0

usage() {
  cat << EOF >&2
This script will initiate ansible provisioning to build a dev environment.

Usage: $PROGNAME [-h,--help] [-s,--skip-roles]

  -h, --help:           This information.
  -s, --skip-roles:     Don't reinstall ansible roles via galaxy

EOF
  exit 1
}

skip_roles() {
  SKIPROLES=yes
}

# Transform long options to short ones
for arg in "$@"; do
  shift
  case "$arg" in
    "--help") set -- "$@" "-h" ;;
    "--skip-roles") set -- "$@" "-s" ;;
    *)        set -- "$@" "$arg"
  esac
done

while getopts hs o; do
  case $o in
    h) usage;;
    s) skip_roles;;
    *) usage
  esac
done
shift "$((OPTIND - 1))"

echo "Welcome to the development environment provisioner! Let's get started."
echo

if [[ -e /usr/bin/ansible ]]
then
    echo "Ansible already installed."
    echo
else
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt -y install ansible
fi

PROJECT_ROOT=$PWD

echo "Determine Windows user directory"
cd /mnt/c
export WINHOME=$(cmd.exe /C "cd /D %USERPROFILE% && bash.exe -c pwd")
echo "[ $WINHOME ]"
cd $PROJECT_ROOT

echo
echo "Starting provisioning ..."
echo

ansible-playbook  --connection="local 127.0.0.1" ./playbook.yml --extra-vars "skip_roles=$SKIPROLES"
