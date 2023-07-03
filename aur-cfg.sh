function get_latest_version {
  curl -s https://get.atomicwallet.io/download/ \
    | grep 'atomicwallet-2.*\.rpm"' \
    | perl -pe 's/.*"atomicwallet-(.+?).rpm".*/\1/; s/\./ /g' \
    | sort -k1n -k2n -k3n \
    | tail -1 \
    | tr ' ' .
}

version_suffix_separator=-

function clean_downloads {
  rm -vf atomicwallet-*.rpm
}
