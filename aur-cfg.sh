function get_latest_version {
  curl -s https://get.atomicwallet.io/download/ \
    | grep 'atomicwallet-2.*\.rpm"' \
    | sort \
    | tail -1 \
    | sed 's/.*wallet-\(2[0-9.-]*\)\.rpm.*/\1/'
}

version_suffix_separator=-
