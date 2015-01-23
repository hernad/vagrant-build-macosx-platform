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


export PATH=HB_QTPATH:$PATH

cd $HOME_BUILD/hb
git checkout -f F18_master
make install
