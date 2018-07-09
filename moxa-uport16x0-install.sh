_pkgname='moxa-uport16x0'
_modulenames=('mxusbserial' 'mxuport')
_origmodname=('mxuport')
_servicename='moxa-uport16x0-settings'
_modulenamesr=()
for (( _idx=${#_modulenames[@]}-1 ; _idx >= 0; _idx-- )); do
  _modulenamesr+=("${_modulenames[${_idx}]}")
done
unset _idx

pre_upgrade() {
  set -u
  systemctl disable "${_servicename}.service"
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    local _modulename
    for _modulename in "${_modulenamesr[@]}"; do
      modprobe -r "${_modulename}"
    done
  fi
  set +u
}

post_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a # now done by pacman hook
    modprobe -r "${_origmodname}" 2> /dev/null # blacklisted on boot
    local _modulename
    for _modulename in "${_modulenames[@]}"; do
      if ! lsmod | cut -d' ' -f1 | grep -q "^${_modulename}"'$'; then
        #echo 'Reboot or load now with:'
        #echo "  sudo modprobe '${_modulename}'"
        modprobe "${_modulename}"
      fi
    done
  else
    echo 'Once installed the new driver can be loaded with'
    echo "  sudo modprobe -r ${_origmodname}$(printf '; sudo modprobe %s' "${_modulenames[@]}")"
  fi
  systemctl daemon-reload
  systemctl enable "${_servicename}.service"
  set +u
}

post_install() {
  set -u
  post_upgrade
  # Doesn't do any good to start it. After install there's nothing in it.
  # systemctl start "${_servicename}.service"
  set +u
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    local _modulename
    for _modulename in "${_modulenamesr[@]}"; do
      modprobe -r "${_modulename}"
    done
  fi
  systemctl disable "${_servicename}.service"
  if [ -d "/usr/src/${_pkgname}"-*/ ]; then
    # dkms remove runs before this so we could run these automatically but that might interrupt services
    echo 'Once removed the old driver can be loaded with'
    echo "  $(printf 'sudo modprobe -r %s; ' "${_modulenamesr[@]}")sudo modprobe ${_origmodname}"
  fi
  set +u
}

post_remove() {
  set -u
  systemctl daemon-reload
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a
    modprobe "${_origmodname}"
  fi
  set +u
}
