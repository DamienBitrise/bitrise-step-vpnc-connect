#!/usr/bin/env bash
set -e

git clone https://github.com/breiter/vpnc.git
cd vpnc
make
sudo su
sudo make install

if [[ ! -z ${config_file_content} ]]; then
  echo "${config_file_content}" | sudo tee -a /etc/vpnc/default.conf
fi

set -- ${commandline_options}
sudo vpnc "$@"
