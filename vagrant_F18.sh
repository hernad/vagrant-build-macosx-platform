#!/bin/bash

cp Vagrantfile.F18 Vagrantfile

RUNNING=`vagrant status | grep -c " running "`

echo $RUNNING

if [ "$RUNNING" == "$1" ] ; 
  vagrant provision
fi
  vagrant up --provision
endif
