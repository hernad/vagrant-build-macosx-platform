# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "maverick-osx"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    #vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
     #brew install caskroom/cask/brew-cask
     brew install Caskroom/cask/xquartz
     #brew install qt5
     ./get_hb.sh

     #git clone http://github.com/knowhow/F18_knowhow.git
     #git checkout master
     #source scripts/mac_ubuntu_set_envars.sh
     #git checkout 1.7
     #./build_relase.sh

  SHELL
end
