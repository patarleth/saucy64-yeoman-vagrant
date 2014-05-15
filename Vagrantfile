VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "saucy64-java-node"
  config.vm.box_url = "http://191.236.23.180/azureuser/vagrant/saucy64-java-node.box"

  config.vm.network :forwarded_port, guest: 80, host: 8880

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :info
    chef.add_recipe 'yeoman'
  end

end
