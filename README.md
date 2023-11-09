# Windows WSL2 development environment provisioner

This is an Ansible-based provisioning tool to set up a local Drupal development environment in Windows WSL2.

The use case is either creating a base setup or keeping multiple WSL2 environments consistent on a single machine 
as you would if you use [wsl2-distro-manager](https://github.com/bostrot/wsl2-distro-manager). 

It will sync SSH keys between the WSL2 and Windows user directories so they wont be lost. I'm assuming everything 
else will be source controlled.

- Run this to install Ansible and provision:
```
./build.sh
```
- You can re-run that to re-provision. You can save a bit of time with `--skip-roles` and it wont fetch all the 
  roles from ansible-galaxy.

## So what gets installed?

- Keychain
- Unison
- PHP 8.1
- Composer
- Node JS
- NPM
- DDEV