# 0 to Imagr-ing in 45 minutes

This is the code used in my talk at MacSysAdmin 2016 in Gothenburg. This repo contains all of the code used, and the open source packages. The only things not included are the VMware Tools package and a macOS image.

## Requirements

* [Vagrant](http://vagrantup.com)
* [The Vagrant VMware plugin](http://vagrantup.com/vmware)
* [VMware Fusion](http://www.vmware.com/products/fusion.html)

## Usage

* Move `Completed_plist/imagr_config_actually_completed.plist` to `Completed_plist/imagr_config.plist`
* `$ vagrant up docker`
* `$ vagrant ssh docker`
* `$ sudo /vagrant/start.sh`
