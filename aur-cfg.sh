function get_latest_version {
  curl -s https://update.tryshift.com/download/version | sed 's/.* version //; s/ .*/\n/'
}
