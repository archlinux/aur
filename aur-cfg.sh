function get_latest_version {
  github_latest_release scalacenter/bloop
}

function clean_downloads {
  rm -vf bloop-*-1.*
}
