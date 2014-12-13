
require 'yaml'

settings = YAML.load_file 'settings.yaml'
node1_ip=settings['node1_ip']
node2_ip=settings['node2_ip']
node1_hostname=settings['node1_ip']
node2_hostname=settings['node2_ip']

Vagrant.configure("2") do |config|

  config.vm.define "node1" do |node1|
  node1.vm.box = "myubuntu"
  node1.vm.box_url = "http://files.vagrantup.com/precise64.box"
  node1.vm.hostname=node1_hostname
  node1.vm.network :public_network, ip: node1_ip, bridge: 'wlan0'
  node1.vm.provision :shell, path: "install_ha_apache.sh"
  node1.vm.provision :shell, inline: "cp /vagrant/ha.cf /etc/ha.d/ha.cf"
  node1.vm.provision :shell, inline: "cp /vagrant/haresources /etc/ha.d/haresources"
  node1.vm.provision :shell, inline: "cp /vagrant/authkeys /etc/ha.d/authkeys"
  node1.vm.provision :shell, inline: "chmod 600 /etc/ha.d/authkeys"
  node1.vm.provision :shell, path: "update_ip.sh"
  node1.vm.provision :shell, inline: "/etc/init.d/heartbeat start"

  end
  config.vm.define "node2" do |node2|
  node2.vm.box = "myubuntu"
  node2.vm.box_url = "http://files.vagrantup.com/precise64.box"
  node2.vm.hostname=node2_hostname
  node2.vm.network :public_network, ip: node2_ip, bridge: 'wlan0'
  node2.vm.provision :shell, path: "install_ha_apache.sh"
  node2.vm.provision :shell, inline: "cp /vagrant/ha.cf /etc/ha.d/ha.cf"
  node2.vm.provision :shell, inline: "cp /vagrant/haresources /etc/ha.d/haresources"
  node2.vm.provision :shell, inline: "cp /vagrant/authkeys /etc/ha.d/authkeys"
  node2.vm.provision :shell, inline: "chmod 600 /etc/ha.d/authkeys"
  node2.vm.provision :shell, path: "update_ip.sh"
  node2.vm.provision :shell, inline: "/etc/init.d/heartbeat start"

  end

end
