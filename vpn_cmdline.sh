#!/bin/bash
# Purpose of this file is to call vpn_cmdline without cd'ing to
# the /usr/bin/ folder. The binary vpn_cmdline is hard coded
# to look within the same directory for array_vpnc.

working_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${working_dir}

./vpn_cmdline_source ${@}
