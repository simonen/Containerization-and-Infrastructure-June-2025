dnf update -y && upgrade -y

useradd -m -s /bin/bash vagrant
echo "vagrant:vagrant" | chpasswd
echo "vagrant ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/vagrant
chmod 0440 -v /etc/sudoers.d/vagrant

echo "--- Install VirtualBox Guest Additions ---"
dnf install -y kernel-devel gcc make tar bzip2 wget elfutils-libelf-devel kernel-headers
mount /dev/sr0 /mnt
sh /mnt/VboxLinuxAdditions.run

sudo mkdir -pv /home/vagrant/.ssh
curl -fsSLv https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
sudo chown -Rv vagrant:vagrant /home/vagrant/.ssh
sudo chmod 700 -v /home/vagrant/.ssh
sudo chmod 600 -v /home/vagrant/.ssh/authorized_keys

echo "--- Cleaning up... ---"
sudo dnf clean all
sudo rm -rfv /tmp/*
sudo rm -rfv /var/cache/dnf
sudo rm -fv /var/log/wtmp /var/log/btmp
sudo rm -rfv /var/log/*

echo '--- Zero out the virtual disk ---'
sudo dd if=/dev/zero of=/EMPTY bs=1M status=progress || true
sudo rm -fv /EMPTY

echo '--- Checking if vboxsf exists... ---'
lsmod | grep vbox

echo "--- Done ---"
