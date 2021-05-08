function get_latest_version {
  curl -s https://github.com/szszoke/sennheiser-gsp670-pulseaudio-profile/releases/latest | perl -pe 's!.*/tag/(.+?)".*!$1!'
}

function clean_downloads {
  rm -rf *.tar.gz
}
