fix_default() {
  if [ ! -x /usr/bin/java ]; then
    /usr/bin/archlinux-java unset
    echo ""
  else
    /usr/bin/archlinux-java get
  fi
}

post_install() {
  echo
  echo "WARNING: jdk11-adoptopenjdk has been replaced by jdk11-temurin!"
  echo "         Please uninstall this package."
  echo
}

post_upgrade() {
  post_install
}

pre_remove() {
  if [ "x$(fix_default)" = "xjava-11-temurin" ]; then
    # java-11-temurin might be accessed through java-11-adoptopenjdk.
    # Explicitly set java-11-temurin as default.
    /usr/bin/archlinux-java unset
    /usr/bin/archlinux-java set java-11-temurin
  fi
}
