post_upgrade() {
  printf "+-----------------------------------------------------------------+\n"
  printf "| In your .bashrc, .zshrc, or similar startup file, please append |\n"
  printf "|   export LRS_OBJ_PATH-\"/usr/lib/lrs/obj\"                        |\n"
  printf "| to allow \`lrsc\` to function properly.                           |\n"
  printf "+-----------------------------------------------------------------+\n"
}

post_install() {
  post_upgrade
}
