#!/bin/bash

#download the new router configuration (recursively)
wget --certificate=/mnt/hostpwd/certs/client.crt --private-key=/mnt/hostpwd/certs/client.key --no-check-certificate  -r --no-parent --reject "index.html*" -P ./ -nH --cut-dirs=1  $CFG_SERVER/testing-213/

#curl -k --key /mnt/hostpwd/certs/client.key --cert /mnt/hostpwd/certs/client.crt $CFG_SERVER/download-new-router-config.sh