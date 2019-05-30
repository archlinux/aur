redundant=(20-unhint-small-dejavu-sans-mono.conf
           20-unhint-small-dejavu-sans.conf
           20-unhint-small-dejavu-serif.conf
           57-dejavu-sans-mono.conf
           57-dejavu-sans.conf
           57-dejavu-serif.conf)

post_install() {

  cat << _EOF

  Thank you for checking out fontconfig-infinality-ultimate.

  By default, fontconfig will use presets for the free font collection
  from [infinality-bundle-fonts] repository.

  If you are going to use either a custom font collection or core
  Microsoft families, set the appropriate presets using
  fc-presets command.

_EOF

  pushd etc/fonts/conf.d > /dev/null
  echo -e "Removing redundant symlinks ..."
  for bit in "${redundant[@]}"; do
    if [ -f ${bit} ]; then
      rm -f ${bit}
    fi
  done
  echo -e "Done."

  echo -e "Creating symlinks for free font collection ..."
  ln -sf ../conf.avail.infinality/free/30-metric-aliases-free.conf .
  ln -sf ../conf.avail.infinality/free/37-repl-global-free.conf .
  ln -sf ../conf.avail.infinality/free/60-latin-free.conf .
  ln -sf ../conf.avail.infinality/free/65-non-latin-free.conf .
  ln -sf ../conf.avail.infinality/free/66-aliases-wine-free.conf .
  echo -e "Done."

  popd > /dev/null

  echo -e "Updating font cache... "
  /usr/bin/fc-cache -f
  echo -e "Done."
}

post_upgrade() {
  echo -e "Updating font cache... "
  /usr/bin/fc-cache -f
  echo "Done."
}

post_remove() {
  pushd etc/fonts/conf.d > /dev/null
  echo -e "Restoring old symlinks ..."
  for bit in "${redundant[@]}"; do
    if [[ ! -f ${bit} ]] && [[ -f ../conf.avail/${bit} ]]; then
      ln -sf ../conf.avail/${bit} .
    fi
  done
  echo -e "Done."

  cat << _EOF

  fontconfig-infinality-ultimate-git has been removed.
  Check for dead symlinks and leftover files
  in /etc/fonts/conf.d/

_EOF
}
