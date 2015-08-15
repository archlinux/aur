post_upgrade() {
  systemctl daemon-reload
  if systemctl -q is-enabled "basis_lmgrd.service"; then
    systemctl start "basis_lmgrd.service"
  fi
  #echo "Startup scripts updated or installed"
  # This prevents editing of the supplied utilites. Please make a copy.
  # chattr ensures that even root can't do it
  chattr +i "/usr/local/basis/pro5"/{ext,std,graphics}/*
}

post_install() {
  post_upgrade
  # It's a shame this path is hard coded into the license manager.
  # This, or maybe a binary patch?
  # Binary patch complete. gnu sed is binary compatible.
  # ln -s '/tmp' '/usr/tmp' || :
}

pre_upgrade() {
  systemctl stop "basis_lmgrd.service"
  if ! chattr -i "/usr/local/basis/pro5"/{ext,std,graphics}/*; then
    # We must do this because of bug https://bugs.archlinux.org/task/45988
    case "/usr/local/basis" in
    '/usr/local/basis') chattr -i '/usr/share/basis/pro5'/{ext,std,graphics}/*;;
    '/usr/share/basis') chattr -i '/usr/local/basis/pro5'/{ext,std,graphics}/*;;
    esac
  fi
}

pre_remove() {
  pre_upgrade
}

post_remove() {
  systemctl daemon-reload
  #echo "startup scripts removed"
  # Having created this outside of the package manager, it isn't safe to delete.
  # Another package may have created it first.
  # Another Install may have configured based on its presence.
  # The admin will need to remove it and put it back if there's problems.
  #if [ -L '/usr/tmp' ]; then
  #  rm -f '/usr/tmp'
  #fi
}
