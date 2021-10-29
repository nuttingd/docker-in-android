set -e

if ! command -v uuidgen > /dev/null
then
  apt update && apt install uuid-runtime
fi

if ! command -v cloud-localds > /dev/null
then
  apt update && apt install cloud-image-utils
fi

# next: mount authorized_keys from host
# https://superuser.com/questions/628169/how-to-share-a-directory-with-the-host-without-networking-in-qemu

echo "instance-id: $(uuidgen || echo i-abcdefg)" > cloudinit-meta-data

cloud-localds cloudinit.img cloudinit-user-data cloudinit-meta-data

#kvm -net nic -net user,hostfwd=tcp::2222-:22 \
#         -drive file=disk1.img,if=virtio -drive file=my-seed.img,if=virtio
#ssh -p 2222 ubuntu@localhost
