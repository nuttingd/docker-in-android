# Docker in Android (via Termux)

Run Docker on your phone using Termux and QEMU

## Getting Started

### In Termux (in Android)

```shell
# Install QEMU and set up Alpine Linux VM
./install-vm
```

The VM will start in Live CD mode, with the Alpine ISO cdrom.

Login with username `root` (no password).

From inside the VM:

```shell
wget <TODO: link to initvm/setup script>
chmod +x setup
# Setup Alpine Linux. Remember your password.
./setup init
poweroff
```

The VM will shut down and you'll return to your Termux shell.

Start the Alpine VM in console mode:

```shell
NO_DAEMON=1 ./start-vm
```

From inside the VM:

```shell
./setup docker
poweroff
```

Install Docker CLI in Termux and create docker-in-android context

```shell
./install-docker
```

Start the VM as a daemon

- SSH: localhost:2222
- Docker: localhost:22375

```shell
./start-vm
# wait a bit for vm to come up
# copy public key to authorized_keys
ssh-copy-id -i ~/.ssh/id_rsa -p 2222 root@localhost
```

Examples of usage:

```shell
# Using the TCP socket
docker -H=localhost:2375 run -it node:lts

# Using the docker-in-android context (SSH-based)

docker context use docker-in-android
docker run -it node:lts
```

### Configuration

Edit `vars`

## TODO

- Set up TLS for Docker TCP
