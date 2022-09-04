#!/bin/bash

set -e

### Programme's version:
_VERSION=0.1_2022-09-04.1

### Timeouts in seconds for network operations
_CONNECT_TIMEOUT=15

### License: GNU General Public License version 3 (GPL3).
#   Copyright 2022, the author.
#
#   Inspired on 2022-07-08 by a similar python script 'woice': https://github.com/keans/woice


### This script performs login, logout and status queris for the captive portal at DB Deutsche Bahn public WiFi at trains and stations.

## In short, for login simply those two things are needed
# 1.: Do a GET a request to get the CSRF token via a cookie. (Note: CSRF token also present in the submit button.)
# 2.: Do a POST request where the CSRF cookie is passed, and the request data contains 'login=true' and also 'CSRFToken' properly set.

## Which can be achieved by the following calls:
# _csrftoken="$(curl --connect-timeout "${_CONNECT_TIMEOUT}" -s -o '/dev/null' --dump-header - "${_request_url}" | grep -E "^Set-Cookie:[[:space:]]+csrf=" | tail -n1 | awk '{print $2}' | awk -F= '{print $2}' | sed -E 's|;$||')"
# curl --connect-timeout "${_CONNECT_TIMEOUT}" -s -o '/dev/null' -b "csrf=${_csrftoken}" -d "login=true&CSRFToken=${_csrftoken}" "${_request_url}"

## This script essentially does the same, only more complex and with more abstractions.


### The following variables hold some hard-coded values regarding the captive portal:
_request_url='http://wifionice.de/en/' # The URL where the login and logout requests are performed at.
# _request_url='http://wifi.bahn.de/en/' # Alternative URL where the login and logout requests are performed at.
_referer="${_request_url}" # Referer to use. It seems that this can be omitted.
_datausage_info_url='http://wifionice.de/usage_info/' # Where the amount of used data can be queried.
_user_agent='Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101 Firefox/103.0' # User agent to use. It seems that this can be omitted.
_login_request='login=true' # The POST request to perform a login.
_logout_request='logout=true' # The POST request to perform a logout.
_CSRF_cookiename='csrf' # Name of the cookie which holds the CSRF token.
_CSRFToken_requestname='CSRFToken' # Name of the POST request variable which holds the CSRF token.


### Helper functions:
msg() {
  # Prints the arguments to stdout, line by line.
  printf '%s\n' "$@"
}

errmsg() {
  # Prints the arguments to stderr, line by line.
  msg "$@" > /dev/stderr
}


### Holds the usage information:
_USAGEINFO="Usage:
  $0 [up|down|toggle|status|datausage|-h|--help|-V|--version]
(for compatibility with the 'woice' script, 'usage' can be used in place of 'datausage'.)"


### Worker functions:
_get_csrftoken() {
  # Does a request to $_request_url and returns the CSRF token to stdout.
  curl --connect-timeout "${_CONNECT_TIMEOUT}" -L -s -S -o '/dev/null' -A "${_user_agent}" -j --dump-header - "${_request_url}" | grep -E "^Set-Cookie:[[:space:]]+${_CSRF_cookiename}=" | tail -n1 | awk '{print $2}' | awk -F= '{print $2}' | sed -E 's|;$||'
  # Note: CSRF token also present in the submit button.
}

_perform_action() {
  # Arguments needed:
  #   $1: What to do; one of 'login', 'logout'.
  #   $2: CSRF token.
  if [ $# -ne 2 ]; then
    errmsg "$0: Error in function '${FUNCNAME[0]}': A wrong amount of arguments was specified, exactly 2 are needed."
    errmsg "  (Amount of arguments specified: $#, arguments specified: $@)"
    errmsg "This should never happen since it is an internal function only."
    errnsg "You have found a bug, please report it!"
    return 101
  fi
  local _what="$1"
  local _csrftoken="$2"
  case "${_what}" in
    login)
      curl --connect-timeout "${_CONNECT_TIMEOUT}" -L -s -S -o '/dev/null' --referer "${_referer}" -b "${_CSRF_cookiename}=${_csrftoken}" -d "${_login_request}&${_CSRFToken_requestname}=${_csrftoken}" "${_request_url}"
    ;;
    logout)
      curl --connect-timeout "${_CONNECT_TIMEOUT}" -L -s -S -o '/dev/null' --referer "${_referer}" -b "${_CSRF_cookiename}=${_csrftoken}" -d "${_logout_request}&${_CSRFToken_requestname}=${_csrftoken}" "${_request_url}"
    ;;
    *)
      errmsg "$0: Error in function '${FUNCNAME[0]}': An unsupported first argument was specified. Allowed are only: 'login', 'logout'."
      errmsg "  (First arguments specified was: '${_what}'.)"
      errmsg "This should never happen since it is an internal function only."
      errnsg "You have found a bug, please report it!"
      return 102
    ;;
  esac
}

_do_login() {
  # Performs a logout.
  _perform_action login "$(_get_csrftoken)"
}

_do_logout() {
  # Performs a logout.
  _perform_action logout "$(_get_csrftoken)"
}

_do_toggle() {
  # Toggles the login/ logout state.
  case "$(_get_status)" in
    'up')
      _do_logout
    ;;
    'down')
      _do_login
    ;;
    *)
      true
    ;;
  esac
}

_get_status() {
  # Prints the login/logout state.
  local _buttontype="$(curl --connect-timeout "${_CONNECT_TIMEOUT}" -L -s -S -o - "${_request_url}" | sed -nE 's/^.*<input[[:space:]].*name="(logout|login)".*$/\1/p')"
  case "${_buttontype}" in
    'login')
      msg 'down'
    ;;
    'logout')
      msg 'up'
    ;;
    *)
      msg 'unknown'
    ;;
  esac
}

_get_datausage() {
  # Prints the used data volume.
  msg "$(curl --connect-timeout "${_CONNECT_TIMEOUT}" -L -s -S -o - --referer "${_referer}" "${_datausage_info_url}")"
}


### Check if enough arguments were provided:
if [ $# -ne 1 ]; then
  errmsg "$0: Error: Too few or too many arguments. You need to specify exactly one action."
  errmsg
  errmsg "${_USAGEINFO}"
  errmsg
  errmsg "Aborting."
  exit 1
else
  _action="$1"
fi


### Decide what to do::
case "${_action}" in
  'up')
    _do_login
  ;;
  'down')
    _do_logout
  ;;
  'toggle')
    _do_toggle
  ;;
  'status')
    _get_status
  ;;
  'datausage'|'usage')
    _get_datausage
  ;;
  '-h'|'--help')
    msg "${_USAGEINFO}"
  ;;
  '-V'|'--version')
    msg "${_VERSION}"
  ;;
  *)
    errmsg "$0: Error: Invalid action '${_action}' specified."
    errmsg "Run '$0 -h' for usage info."
    errmsg "Aborting."
    exit 2
  ;;
esac
