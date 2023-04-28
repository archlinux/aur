#!/usr/bin/env bash

_get() {
  _uri="${1}"
  ipfs cat "${_uri}" > "${_out}"
  ipfs shutdown
}

_uri="${1}"
_out="${2}"
_get "${_uri}" "${_out}"
