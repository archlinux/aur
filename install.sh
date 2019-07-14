update_vim_help() {
  echo -n "Updating Vim help tags..."
  /usr/bin/vim --noplugin -u NONE -U NONE \
    --cmd ":helptags /usr/share/vim/vimfiles/doc" --cmd ":q" > /dev/null 2>&1
  echo "done."
}

post_install() {
  update_vim_help
}

post_upgrade() {
  update_vim_help
}

post_remove() {
  update_vim_help
}
