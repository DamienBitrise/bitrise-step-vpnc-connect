#!/usr/bin/env/bash
set -e

if [[ ! -z ${config_file_content} ]]; then
  echo "${config_file_content}" > /etc/vpnc/default.conf
fi

set -- ${commandline_options}
vpnc "$@"
