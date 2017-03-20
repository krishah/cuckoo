#!/bin/bash
apt-get remove apt-listchanges
apt-get update && sudo apt-get upgrade -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
apt-get install git mongodb python python-dev python-pip python-m2crypto libmagic1 swig libvirt-dev upx-ucl libssl-dev wget unzip p7zip-full geoip-database libgeoip-dev libjpeg-dev mono-utils yara python-yara ssdeep libfuzzy-dev exiftool curl openjdk-8-jre-headless
apt-get install postgresql postgresql-contrib libpq-dev
pip install psycopg2
apt-get install wkhtmltopdf xvfb xfonts-100dpi
apt-get install tcpdump libcap2-bin
chmod +s /usr/sbin/tcpdump
apt-get install clamav clamav-daemon clamav-freshclam
pip install git+https://github.com/kbandla/pydeep.git
apt-get install uthash-dev libconfig-dev libarchive-dev libtool autoconf automake checkinstall
mkdir /opt/cuckoo-install
# malheur
cd /opt/cuckoo-install
git clone https://github.com/rieck/malheur.git
cd malheur
./bootstrap
./configure --prefix=/usr
make
checkinstall
#
#volatility
apt-get install python-pil
pip install distorm3 pycrypto openpyxl
pip install git+https://github.com/volatilityfoundation/volatility.git
apt-get install libboost-all-dev
pip install git+https://github.com/buffer/pyv8 # This can take a long time, and may appear to han
#
#suricta
apt-get install suricata
cp /etc/suricata/suricata-debian.yaml /etc/suricata/suricata-cuckoo.yaml

#user

adduser cuckoo
usermod -L cuckoo

usermod -a -G kvm cuckoo
usermod -a -G libvirt cuckoo

sudo su cuckoo
cd
wget https://bitbucket.org/mstrobel/procyon/downloads/procyon-decompiler-0.5.30.jar
git clone https://github.com/spender-sandbox/cuckoo-modified.git
mkdir vmshared
cp cuckoo-modified/agent/agent.py vmshared/agent.pyw
exit
chmod ug=rwX,o=rX ~cuckoo/vmshared
mv ~cuckoo/cuckoo-modified /opt/cuckoo
pip install -r /opt/cuckoo/requirements.txt
su cuckoo
cd /opt/cuckoo/utils
./community.py -afw
exit







