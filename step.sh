#!/usr/bin/env bash
set -e

git clone https://github.com/breiter/vpnc.git
cd vpnc
make
sudo make install
chown root /etc/vpnc/default.conf

if [[ ! -z ${config_file_content} ]]; then
  sudo echo "${config_file_content}" > /etc/vpnc/default.conf
fi

set -- ${commandline_options}
vpnc "$@"
