post_upgrade() {
  #mandb -q
  systemctl daemon-reload
  #depmod -a
  systemctl -q is-enabled "basis_lmgrd.service"
  if [ "$?" -eq "0" ]; then  
    systemctl start "basis_lmgrd.service"
  fi
  #echo "Startup scripts updated or installed"
  # This prevents editing of the supplied utilites. Please make a copy.
  # chattr ensures that even root can't do it
  chattr +i /usr/local/basis/pro5/ext/* /usr/local/basis/pro5/std/* /usr/local/basis/pro5/graphics/*
}

post_install() {
  post_upgrade
  # It's a shame this path is hard coded into the license manager.
  # This, or maybe a binary patch?
  ln -s /tmp /usr/tmp || :
}

pre_upgrade() {
  systemctl stop "basis_lmgrd.service"
  chattr -i /usr/local/basis/pro5/ext/* /usr/local/basis/pro5/std/* /usr/local/basis/pro5/graphics/*
}

pre_remove() {
  pre_upgrade
}

post_remove() {
  systemctl daemon-reload
  #echo "startup scripts removed"
  #mandb -q
  if [ -L /usr/tmp ]; then
    rm -f /usr/tmp
  fi
}
