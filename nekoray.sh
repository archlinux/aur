#!/bin/sh
ntf_preinst_text=( 'An Update Is Required' 'Mahdi-zarei/Nekoray has been renamed to Throne.
"Install Update" will start the automatic update process of the AUR package,
during which you will be prompted to enter your password to continue the installation.
The whole process may take some time.' )
ntf_postinst_text=( 'Installation Complete' 'All temporary files have been deleted, the program is ready to work.' )

ntf_preinst_args=( '--urgency=critical' '--action=open_page=Open AUR Page' '--action=install_update=Install Update')
ntf_common_args=( '--app-name=Nekoray' '--icon=nekobox' )

result=$(notify-send "${ntf_preinst_text[@]}" "${ntf_preinst_args[@]}" "${ntf_common_args[@]}" )

if [[ $result == "open_page" ]]; then
  xdg-open "https://aur.archlinux.org/packages/throne-bin" 1>/dev/null 2>&1

elif [[ $result == "install_update" ]]; then
  tmpdir=/tmp/throne-bin-update-files

  rm -f $tmpdir
  git clone https://aur.archlinux.org/throne-bin.git $tmpdir && cd $tmpdir
  makepkg --clean

  # Hack to run multiple commands with one password prompt
  cat << EOF > replace_nekoray_with_throne.sh
#!/bin/sh
pacman -Rnsc --noconfirm nekoray-mahdi-zarei-bin
pacman -U --noconfirm throne-bin-*.pkg.tar.zst
EOF
  chmod +x replace_nekoray_with_throne.sh
  run0 ./replace_nekoray_with_throne.sh

  cd .. && rm -rf $tmpdir

  notify-send "${ntf_postinst_text[@]}" "${ntf_common_args[@]}"

else
  /usr/lib/nekoray/nekoray -- -appdata
fi
