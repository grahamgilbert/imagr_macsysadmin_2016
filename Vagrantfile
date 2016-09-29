# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define "docker" do |docker|
    docker.vm.box = "bento/ubuntu-14.04"
    docker.vm.network "private_network", ip: "192.168.33.10"
    docker.vm.provision "shell", inline: <<-SHELL
      # Make sure curl is installed
      apt-get update -y
      apt-get install -y curl

      # Install Docker - DO NOT DO THIS IN PROD, I'M LAZY
      curl -sSL https://get.docker.com/ | sh

      # Initial pull of the images to save time
      docker pull grahamgilbert/proxy
      docker pull macadmins/tftpd
      docker pull bruienne/bsdpy:1.0
      chmod +x /vagrant/start.sh
      mkdir -p /usr/local/bin
      ln -s /vagrant/start.sh /usr/local/bin/start.sh
      usermod -aG docker vagrant
      service docker restart
    SHELL
  end
  config.vm.define "client", autostart: false do |client|
    client.vm.box = "darwin-1011"
    client.ssh.insert_key = false
    client.vm.provider "vmware_fusion" do |v|
          v.gui = true
          v.vmx["memsize"] = "4096"
          v.vmx["numvcpus"] = "2"
          v.vmx["SMBIOS.use12CharSerialNumber"] = "TRUE"
    end

  end

  end
