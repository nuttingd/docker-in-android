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

## Troubleshooting

`Host key verification failed`
Connect once to the VM using SSH so the host is added to ~/.ssh/known_hosts.

Other SSH auth related errors. Be sure the host bound files in /mnt/host are owned by `ubuntu:ubuntu` and have proper permissions (600 for authorized_keys).
