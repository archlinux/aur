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
  echo "WARNING: jdk-adoptopenjdk has been replaced by jdk-temurin!"
  echo "         Please uninstall this package."
  echo
}

post_upgrade() {
  post_install
}

pre_remove() {
  if [ "x$(fix_default)" = "xjava-17-temurin" ]; then
    # java-17-temurin might be accessed through java-17-adoptopenjdk.
    # Explicitly set java-17-temurin as default.
    /usr/bin/archlinux-java unset
    /usr/bin/archlinux-java set java-17-temurin
  fi
}
