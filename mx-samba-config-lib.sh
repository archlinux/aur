#!/usr/bin/env bash

#root level functions requiring password for mx-samba-config

enablesamba() {
  systemctl unmask smb
  systemctl unmask nmb
  systemctl enable smb
  systemctl enable nmb
}


disablesamba() {
  systemctl disable smb
  systemctl disable nmb
  systemctl mask smb
  systemctl mask nmb
}

addsambauser() {
  echo -ne "$pass\n$pass" | smbpasswd -as "$user"
  exit $?
}

removesambauser() {
  pdbedit --delete "$user"
  exit $?
}

changesambapasswd() {
  echo -ne "$pass\n$pass" | smbpasswd -U "$user"
  exit $?
}

startsamba() {
  systemctl unmask smb
  systemctl unmask nmb

  systemctl start smb
  systemctl start nmb

  exit $?
}

stopsamba() {
  systemctl stop smb
  systemctl stop nmb
  exit $?
}


main() {
  case $1 in
    startsamba)
      startsamba
      ;;
    stopsamba)
      stopsamba
      ;;
    enablesamba)
      enablesamba
      ;;
    disablesamba)
      disablesamba
      ;;
    addsambauser)
      user="$3"
      pass="$2"
      addsambauser
      ;;
    removesambauser)
      user="$2"
      removesambauser
      ;;
    changesambapasswd)
      user="$3"
      pass="$2"
      changesambapasswd
      ;;
  esac
}

main "$@"
