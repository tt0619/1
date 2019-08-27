cp mark.sh /usr/local/bin/mark.sh
cp routing.service /etc/systemd/system/routing.service
cp miner.service /etc/systemd/system/miner.service
cp miner.timer /etc/systemd/system/miner.timer
cp client.conf /etc/openvpn/client.conf
chmod 744 /usr/local/bin/mark.sh
chmod 664 /etc/systemd/system/routing.service
chmod 664 /etc/systemd/system/miner.service
chmod 664 /etc/systemd/system/miner.timer
systemctl daemon-reload
systemctl enable routing.service
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "vm.nr_hugepages=128" >> /etc/sysctl.conf
#echo "HzC7Q_mcoY0436rXQbs1NXtA" > /etc/openvpn/auth.txt
echo "Ms58tmQMh0BBXdSc2El9Hajj" >> /etc/openvpn/auth.txt
mkdir /home/miner
useradd -G adm -d /home/miner miner
chown -R miner /home/miner
passwd miner #xss4p6CR
sudo usermod -a -G sudo miner
tar -xvf PhoenixMiner_4.2c_Linux.tar.gz --directory /home/miner/
cp miner.cfg /home/miner/PhoenixMiner_4.2c_Linux/epools.txt
chown -R miner /home/miner/*
systemctl enable miner.timer
systemctl enable miner.service
