# -*- mode: ruby -*-
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  config.vm.box = "chef/debian-7.4"
#  config.vm.box_url = "https://vagrantcloud.com/chef/debian-7.4/version/1/provider/virtualbox.box"
#  config.vm.box_url = "https://downloads.sourceforge.net/project/vagrantboxjessie/debian80.box"
  config.vm.box_url = "https://vagrantcloud.com/deb/jessie/version/1/provider/virtualbox.box"

  config.vm.synced_folder "etc/apt/sources.list.d", "/etc/apt/sources.list.d", owner: "root"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.define "node0" do |node|
    node.vm.box = "deb/jessie"
    config.vm.hostname = "node0"
    config.vm.synced_folder "salt", "/srv/salt"
  end
end
