#!/bin/bash

#export HB_PLATFORM=darwin

HOME_BUILD=/Users/vagrant
HOME_PLATFORM=$HOME_BUILD/Platform
export HB_ROOT=$HOME_PLATFORM/HB

#brew 
export HB_WITH_QT=/usr/local/opt/qt5/include
export HB_QTPATH=/usr/local/opt/qt5/bin

export HB_WITH_PGSQL=$HOME_PLATFORM/PSQL/include
export HB_INSTALL_PREFIX=$HB_ROOT


export PATH=HB_QTPATH:$PATH:$HB_ROOT/bin

cd $HOME_BUILD
# git clone https://github.com/knowhow/F18_knowhow.git
cd F18_knowhow
git checkout -f 1.7
git clean -d -fx
git pull
source scripts/mac_set_envars.sh

./build_release.sh

sudo cp /vagrant/hernad_ssh.key $HOME_BUILD
sudo chown vagrant $HOME_BUILD/*.key
chmod 0700 $HOME/*.key

scripts/build_gz.sh XX --push
