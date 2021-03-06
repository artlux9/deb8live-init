#!/bin/bash
#
# Author: Art Lux
# Copyright: Art Lux 2015
# Info: Debian 8 live user customization script.

if [ "$EUID" -ne 0 ]
  then echo "Are you root? "
  exit
fi

#remove ssh
/etc/init.d/ssh stop;
apt-get -y remove ssh;

#remove exim
#/etc/init.d/exim4 stop;
killall exim4;
apt-get -y remove exim4;

#remove avahi 
killall avahi-daemon;
#apt-get -y remove avahi-daemon;


#create log directory
#mkdir /home/user/logs;
#chown -R user. /home/user/logs;

#new root pw
newrootpw=`< /dev/urandom tr -dc A-Za-z0-9 | head -c128`;
echo root:$newrootpw | /usr/sbin/chpasswd;

#new user pw
newuserpw=`< /dev/urandom tr -dc A-Za-z0-9 | head -c24`;
echo user:$newuserpw | /usr/sbin/chpasswd;
echo "";
echo "";
echo $newuserpw;
echo "";
echo "";
echo "Or make a new user password: \n";
passwd user;
echo "";
echo "";

#install
apt-get -y install libappindicator1 libcurl3 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7;
dpkg -i /media/user/Storage/Scripts/deb8live-init/google-chrome-stable_current_amd64.deb;

echo "";echo "";echo "";echo "";echo "";echo "";echo "";

apt-get -y install vim;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";
apt-get -y install vlc;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";
apt-get -y install git;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";
#apt-get -y install x2goclient;

#hostname
newhostname=`< /dev/urandom tr -dc A-Za-z0-9 | head -c33`;
sed -i "s/debian/$newhostname/g" /etc/hosts;
sed -i "s/debian/$newhostname/g" /etc/hostname;
invoke-rc.d hostname.sh start;
invoke-rc.d networking force-reload;
invoke-rc.d network-manager force-reload;

echo "";echo "";echo "";echo "";echo "";echo "";echo "";


#ConfigServer Firewall
rm csf.tgz;
cd;
wget http://configserver.com/free/csf.tgz;
tar xzvf csf.tgz;

cd csf;
./install.sh;

rm csf.tgz;

#disable testing (enables lfd)
sed -i 's/TESTING\ =\ "1"/TESTING\ =\ "0"/g' /etc/csf/csf.conf;

#disable faststart
sed -i 's/FASTSTART\ =\ "1"/FASTSTART\ =\ "0"/g' /etc/csf/csf.conf;

#tcp in
sed -i 's/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995"/TCP_IN = "53,51413,9876"/g' /etc/csf/csf.conf;

#tcp out
sed -i 's/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995"/TCP_OUT = "22,53,80.443.5000.6969,8080.8083.51413"/g' /etc/csf/csf.conf;

#udp in
sed -i 's/UDP_IN = "20,21,53"/UDP_IN = "53"/g' /etc/csf/csf.conf;

#udp out
sed -i 's/UDP_OUT = "20,21,53,113,123"/UDP_OUT = "53,113,123"/g' /etc/csf/csf.conf;

#tcp6 in
sed -i 's/TCP6_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995"/TCP6_IN = ""/g' /etc/csf/csf.conf;

#tcp6 out
sed -i 's/TCP6_OUT = "20,21,22,25,53,80,110,113,443,587,993,995"/TCP6_OUT = ""/g' /etc/csf/csf.conf;

#udp6 in
sed -i 's/UDP6_IN = "20,21,53"/UDP6_IN = ""/g' /etc/csf/csf.conf;

#udp6 out
sed -i 's/UDP6_OUT = "20,21,53,113,123"/UDP6_OUT = ""/g' /etc/csf/csf.conf;

echo "";echo "";echo "";echo "";echo "";echo "";echo "";

#disable, enable, reload rules
/usr/sbin/csf -x;
sleep 1;
/usr/sbin/csf -e;
sleep 1;
/usr/sbin/csf -r;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";




updatedb;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";

apt-get -y update;
echo "";echo "";echo "";echo "";echo "";echo "";echo "";

echo "";
echo "";
echo "     _________________________________ ";
echo "    /                                / ";
echo "   /        Hooray!                 /  ";
echo "  /                        :)      /   ";
echo " /________________________________/    ";
echo "";
echo "";



