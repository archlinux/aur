#!/usr/bin/bash

# Because pkexec can't export 
_run_mkarchiso() {
  _gnupg_home="${1}"
  _dest="${2}"
  _pgp_key_id="${3}"
  _pgp_sender="${4}"
  _work_dir="${5}"
  _profile="${6}"

  GNUPGHOME="${_gnupg_home}" /usr/bin/mkarchiso -v \
                            -o "${_dest}" \
                            -g "${_pgp_key_id}" \
                            -G "${_pgp_sender}" \
		            -w "${_work_dir}" \
	                    "${_profile}"
}

gnupg_home="${1}"
dest="${2}"
pgp_key_id="${3}"
pgp_sender="${4}"
work_dir="${5}"
profile="${6}"

_run_mkarchiso "${gnupg_home}" "${dest}" "${pgp_key_id}" "${pgp_sender}" "${work_dir}" "${profile}"
