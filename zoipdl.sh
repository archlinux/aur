#!/usr/bin/bash

# Usage:
# This gets called from makepkg DLAGENTS https
# or you can run it manually.

# https://unix.stackexchange.com/questions/406462/how-to-download-a-file-in-terminal-which-link-redirects-and-seems-to-work-in-gui

set -u
set -e

echo "${0##*/}: $@"

_fn_zoip() {
  _cookie='/tmp/zoiper_cookies.txt'
  _url1='https://www.zoiper.com/en/voip-softphone/download/current'
  _url2='https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux'
  _uagent='Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0'
  # https://stackoverflow.com/questions/17182553/sites-not-accepting-wget-user-agent-header
  # https://stackoverflow.com/questions/28760694/how-to-use-curl-to-get-a-get-request-exactly-same-as-using-chrome
  _opts=(--user-agent "${_uagent}") # Yay, same option curl and wget
  _fn_moreopts() {
    _opts+=(--header 'Accept: text/html')
  }

  if :; then
    curl -c "${_cookie}" "${_opts[@]}" -f -s -o '/dev/null' "${_url1}"
    _fn_moreopts
    curl -b "${_cookie}" "${_opts[@]}" -f -C '-' -O -J "${_url2}"
    # curl -b <( curl -c - -o '/dev/null' 'https://www.zoiper.com/en/voip-softphone/download/current' ) -o 'zoiper5_5.2.6_x86_64.tar.xz' 'https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux'
  else
    wget -q -O /dev/null --keep-session-cookies --save-cookies "${_cookie}" "${_opts[@]}" "${_url1}"
    _fn_moreopts
    # https://stackoverflow.com/questions/13343314/how-to-get-real-filename-from-wget
    wget --content-disposition --load-cookies "${_cookie}" "${_opts[@]}" --continue "${_url2}"
  fi
  rm -f "${_cookie}"
  # This makes updpkgsums and makepkg work in one step
  if [ ! -z "${1:-}" ] && [ "${1}" != "${1%.part}" ] && [ -f "${1%.part}" ]; then
    mv "${1%.part}" "${1}"
  fi
}

_fn_zoip
