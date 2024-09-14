#!/bin/bash
# vim: set sw=2 ts=8 sts=2:


handler()
{
  me="epsxe-sh"
  lopts='help,link'
  INSTALL=false
  LINK=false
  VERBOSE=false


  PARSED=$(getopt -o '' -l $lopts --name "$0" -- "$@")

  eval set -- "$PARSED"

  while :; do
    case "$1" in 
      --help)
        cat <<EOF
Usage: $me [OPTION...]
  --help      print this message and exit
  --verbose   print out what this script is doing
  --link      create symlinks for plugins, shaders, and configs in \$HOME/.epsxe/

Install requires root permissions

(Epsxe proper does not use long options)
EOF
  # --install   copy plugins, shaders, and configs to \$HOME/.epsxe/
        shift
        ;;
      --verbose) 
        VERBOSE=true
        shift
        ;;
      --install)
        INSTALL=true
        LINK=false
        shift
        ;;
      --link)    
        LINK=true
        INSTALL=false
        shift
        ;;
      --) 
        shift
        break
        ;;
    esac
  done
  [[ $VERBOSE = true ]] && set -xv

  if [[ $INSTALL = true ]]; then
    echo 'Copying files to $HOME/.epsxe'
    sudo cp -r /opt/epsxe/{plugins,shaders,config} $HOME/.epsxe
    echo 'Changing ownership'
    sudo chown $USER:games -R $HOME/.epsxe/{plugins,shaders,config}
    echo 'Changing permissions'
    sudo chmod o-rwx  -R $HOME/.epsxe/{plugins,shaders,config}
  elif [[ $LINK = true ]]; then
    for f in plugins shaders config; do
      your="$HOME/.epsxe/$f"
      [[ -d $your ]] && mv "$your" "$your~"
      ln -sf /opt/epsxe/{plugins,shaders,config} $HOME/.epsxe/
      ln -sf $HOME/.epsxe/plugins/cfgpeopsxgl $HOME/.epsxe/
    done
  fi

  [[ $VERBOSE = true ]] && set +xv
}

handler "$@"

LD_LIBRARY_PATH+=:/opt/epsxe /opt/epsxe/epsxe "$@"
