#!/bin/bash
 # Collect the current user's ssh and enable passwords
 echo -n "Enter the SSH password for $(whoami) :"
 read -s -e password
 echo -ne '\n'

#Enter building name to create list
 echo "Enter the building, i.e, js0050-"
 read building

grep $building /tftpboot/all_spectrum_devices >> device-list.txt

for device in `cat device-list.txt`; do
 ./power.exp $device $password ;
 done

egrep 'js0|Power Supply' results.log 
rm device-list.txt
rm results.log
