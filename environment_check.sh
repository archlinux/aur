#!/usr/bin/bash

# Based on script/environment_check.sh in binary tarball.
# -c means check only.

if [ "$1" = "-c" ]; then
    # 只验证 certutil 是否可用
    if command -v certutil &>/dev/null; then
        exit 200
    else
        echo "请手动安装 certutil 工具。"
        exit 1
    fi
else
  # https://github.com/BeyondDimension/SteamTools/blob/develop/src/BD.WTTS.Client/Services.Implementation/Platform/Linux/LinuxPlatformServiceImpl.Certificate.cs#L18
  # They does not like XDG Specification, which uses ${XDG_DATA_HOME:$HOME/.local/share}/pki/nssdb instead obsolete $HOME/.pki/nssdb.
  if ! certutil -d "$HOME/.pki/nssdb" -L; then
    mkdir -p -m=700 "$HOME/.pki/nssdb"
    certutil -d "$HOME/.pki/nssdb" -N --empty-password
  fi
fi
