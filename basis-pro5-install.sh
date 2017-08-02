_opt_blmgr_user='nobody'
_opt_blmgr_group='nobody'
_basefolder='/usr/local'
_basedir='/usr/local/basis'
_logfolder='/var/log/basis'
_servicefile='basis_lmgrd.service'

post_upgrade() {
  set -u
  systemctl daemon-reload
  if systemctl -q is-enabled "${_servicefile}"; then
    systemctl start "${_servicefile}"
  fi
  #echo 'Startup scripts updated or installed'
  # This prevents editing of the supplied utilites. Please make a copy.
  # chattr ensures that even root can't do it
  #chattr -f +i "${_basedir}/pro5"/{ext,std,graphics}/* # Pro/5 ERROR=13 when trying to open a chattr +i file
  # Allow dynamic licenses to self update
  chown -R "${_opt_blmgr_user}:${_opt_blmgr_group}" "${_basefolder}/basis/blmgr"
  chown "root:${_opt_blmgr_group}" "${_logfolder}"
  chown -R "${_opt_blmgr_user}:${_opt_blmgr_group}" "${_logfolder}"/*
  #if [ "$1" != "$2" ]; then
  #  echo 'Reregister your license on version change to prevent license errors'
  #  echo "  sudo ${_basedir}/blmgr/BLMrun"
  #fi
  rm -f "${_basedir}/blmgr/Register.properties.pacnew"
  # Show warning when perpetual license fails
  if [ -s "${_basedir}/blmgr/log/updatelic.log" ]; then
    # http://stackoverflow.com/questions/7724778/sed-return-last-occurrence-match-until-end-of-file
    tac "${_basedir}/blmgr/log/updatelic.log" | sed -e '/^updateLic(): starting/q' | tac > '/tmp/basis.pro5.log'
    if ! grep -q -e '-> returning: 0|' '/tmp/basis.pro5.log'; then
      tput 'bold'
      tput 'setaf' 1
      echo -e "\nPerpetual license warning:\n"
      cat '/tmp/basis.pro5.log'
      echo -e "less +G -S ${_basedir}/blmgr/log/updatelic.log for details."
      echo -e "Usually fixed by running ${_basedir}/blmgr/BLMrun as root"
      tput 'setaf' 4
      echo -e '\nIf you have recently updated the license you can ignore this warning.\n'
      tput 'sgr0'
    fi
    rm -f '/tmp/basis.pro5.log'
  fi
  set +u
}

post_install() {
  post_upgrade
  # It's a shame this path is hard coded into the license manager.
  # This, or maybe a binary patch?
  # Binary patch complete. gnu sed is binary compatible.
  # ln -s '/tmp' '/usr/tmp' || :
}

pre_upgrade() {
  set -u
  systemctl stop "${_servicefile}"
  rm -rf '/var/tmp/.flexlm'
  rm -f '/var/tmp/lockbasis' # otherwise a user change cannot work
  if ! chattr -f -i "${_basedir}/pro5"/{ext,std,graphics}/*; then
    # We must do this because of bug https://bugs.archlinux.org/task/45988
    case "${_basedir}" in
    '/usr/local/basis') chattr -f -i '/usr/share/basis/pro5'/{ext,std,graphics}/*;;
    '/usr/share/basis') chattr -f -i '/usr/local/basis/pro5'/{ext,std,graphics}/*;;
    esac
  fi
  set +u
}

pre_remove() {
  pre_upgrade
}

post_remove() {
  systemctl daemon-reload
  #echo 'startup scripts removed'
  # Having created this outside of the package manager, it isn't safe to delete.
  # Another package may have created it first.
  # Another Install may have configured based on its presence.
  # The admin will need to remove it and put it back if there's problems.
  #if [ -L '/usr/tmp' ]; then
  #  rm -f '/usr/tmp'
  #fi
}
