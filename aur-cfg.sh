function get_latest_version {
  curl -s https://github.com/CryptoGraphics/VerthashMiner/releases/latest | perl -pe 's!.*/tag/v?([0-9].+?)".*!$1!'
}

function clean_downloads {
  rm -rf VerthashMiner
}
