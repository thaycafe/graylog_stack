useradd -m -s /bin/bash sysadmin

cat <<EOF > /etc/hosts
127.0.0.1 localhost.localdomain localhost
192.168.56.10 k3s-master.example.com k3s-master
192.168.56.20 k3s-worker1.example.com k3s-worker1
192.168.56.30 k3s-worker2.example.com k3s-worker2
EOF

echo 'sysadmin ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/sysadmin




