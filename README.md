# Win10 WSL2 development environment provisioner

This is an Ansible-based provisioning tool to set up a bunch of Ubuntu cli development tools. It is specifically for Windows 10 WSL2 and was created with destroying and rebuilding the WSL2 environment in mind. It will sync SSH keys between the WSL2 and Win10 user directories so they wont be lost. I'm assuming everything else will be source controlled.

- Run this to install Ansible and provision:
```
./build.sh
```
- You can re-run that script to re-provision. You can save a bit of time with `--skip-roles` and it wont fetch all the roles from ansible-galaxy.

## So what gets installed?

- Keychain
- Unison
- Apache
- Apache PHP FPM
- PHP 7.2
- Composer
- Node JS
- NPM
- yarn
- Vagrant
- Docker
- Lando

