# Docker in Android (via Termux)

Run Docker on your phone using Termux and QEMU

## Getting Started

### In Termux (in Android)

```shell
# Install QEMU and set up ubuntu VM
./install-vm

# Add ssh key to bind/authorized_keys
gpg --export-ssh-key keyid > bind/authorized_keys

# wait for the vm to fully start. It takes a few minutes

# ** open another shell in termux **
# run some containers!

docker run node

```
