#!/usr/bin/env sh

# We should disable UBUNTU_MENUPROXY for KDE because KDE's global menu lagging
# with nxmc's menu.

if [ "${XDG_CURRENT_DESKTOP/KDE//}" != "${XDG_CURRENT_DESKTOP}" ]; then
	export UBUNTU_MENUPROXY=
fi

/opt/nxmc/nxmc $@
