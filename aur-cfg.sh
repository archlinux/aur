function get_latest_version {
  curl -s https://github.com/tlaplus/tlaplus/releases/latest | perl -pe 's!.*/tag/v?([0-9].+?)".*!$1!'
}

function clean_downloads {
  rm -vf *.jar
}
