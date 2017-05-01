# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.define "micro-config-drive"

  config.vm.box = "ailispaw/barge"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :docker do |d|
    d.build_image "/vagrant/", args: "-t ailispaw/ucd"
  end
end
