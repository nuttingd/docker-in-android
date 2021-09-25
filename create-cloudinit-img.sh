if ! command -v cloud-localds > /dev/null
then
  echo Please install cloud-localds
  return 1
fi
cat << 'EOF' > cloudinit-user-data
#cloud-config
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
EOF

echo "instance-id: $(uuidgen || echo i-abcdefg)" > cloudinit-meta-data

cloud-localds cloudinit.img cloudinit-user-data cloudinit-meta-data

#kvm -net nic -net user,hostfwd=tcp::2222-:22 \
#         -drive file=disk1.img,if=virtio -drive file=my-seed.img,if=virtio
#ssh -p 2222 ubuntu@localhost
