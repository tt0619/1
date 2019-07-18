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
mkdir /home/miner/gminer
wget https://github.com/develsoftware/GMinerRelease/releases/download/1.51/gminer_1_51_linux64.tar.xz
tar -xvf gminer_1_51_linux64.tar.xz --directory /home/miner/gminer
rm gminer_1_51_linux64.tar.xz
cp miner.cfg /home/miner/gminer/mine_grin29.sh
chown -R miner /home/miner/*
systemctl enable miner.timer
systemctl enable miner.service