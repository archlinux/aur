function get_latest_version {
  curl -s https://github.com/vertcoin-project/vertcoin-core/releases/latest | perl -pe 's!.*/tag/v?([0-9].+?)".*!$1!'
}

function clean_downloads {
  rm -vf vertcoin-qt-*.zip*
}
