#!/usr/bin/bash

# Because pkexec can't export 
_run_mkarchiso() {
  local _gnupg_homedir="${1}"
  local _dest="${2}"
  local _pgp_key_id="${3}"
  local _pgp_sender="${4}"
  local _work_dir="${5}"
  local _profile="${6}"

  export GNUPGHOME="${_gnupg_homedir}"
  echo "$GNUPGHOME"
  env GNUPGHOME="${_gnupg_homedir}" /usr/bin/mkarchiso -v \
                                    -o "${_dest}" \
                                    -g "${_pgp_key_id}" \
                                    -G "${_pgp_sender}" \
				    -H "${_gnupg_homedir}" \
                                    -w "${_work_dir}" \
                                       "${_profile}"
}

gnupg_homedir="${1}"
dest="${2}"
pgp_key_id="${3}"
pgp_sender="${4}"
work_dir="${5}"
profile="${6}"

GNUPGHOME="${gnupg_homedir}" _run_mkarchiso "${gnupg_homedir}" "${dest}" "${pgp_key_id}" "${pgp_sender}" "${work_dir}" "${profile}"
