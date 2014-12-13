echo `grep bart /vagrant/ip.yaml | cut -d " " -f 2 |  tr -d '\r'` bart >> /etc/hosts
echo `grep lisa /vagrant/ip.yaml | cut -d " " -f 2 |  tr -d '\r'` lisa >> /etc/hosts
sed -i -e "s/192.168.1.71/`grep virtual /vagrant/ip.yaml | cut -d \" \" -f 2 |  tr -d \'\r\'`/g" /etc/ha.d/haresources
