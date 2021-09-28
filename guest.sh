sudo su
mkdir -p /mnt/host-bind
chown ubuntu:ubuntu /mnt/host-bind

mount -a
chown ubuntu:ubuntu /mnt/host-bind
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
chown ubuntu:ubuntu /home/ubuntu/.ssh
ln -sf /mnt/host-bind/authorized_keys /home/ubuntu/.ssh/authorized_keys


