#!/bin/bash

FILE=harbour_core.tar.gz

if [ ! -f ftp_server_path.config ] ; then
   echo nedostaje fajl: ftp_server_path.config
   echo napravicu default config:
   echo "ftp://router-7.bring.out.ba/Main/files/Platform" > ftp_server_path.config
   exit 1
fi

if [ ! -f ftp_user_password.config ] ; then
   echo nedostaje fajl: ftp_user_password.onfig
   echo napravicu default config:
   echo 'ftpadmin:password' > ftp_user_password.config
   exit 1
fi

FTP_PATH=`cat ftp_server_path.config`
FTP_PWD=`cat ftp_user_password.config`

function put_file() { 

 FILE=$1

 RUN_PARAMS="-s -T $FILE $FTP_PATH/  --user $FTP_PWD"
 echo curl run params: $RUN_PARAMS
 curl $RUN_PARAMS
}

HOME_BUILD=/Users/vagrant
HOME_PLATFORM=$HOME_BUILD/Platform

cd $HOME_PLATFORM/HB
zip -r HB_Platform_macosx.zip .
put_file HB_Platform_macosx.zip


#SSH_OPTS="-i /root/hernad_ssh.key -o StrictHostKeyChecking=no"
 
#scp $SSH_OPTS HB_Platform*.zip root@files.bring.out.ba:/mnt/HD/HD_a2/bringout/Platform/linux32
#ssh $SSH_OPTS root@files.bring.out.ba chown hernad /mnt/HD/HD_a2/bringout/Platform/linux32/HB_Platform*.zip
