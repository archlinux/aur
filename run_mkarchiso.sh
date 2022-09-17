#!/usr/bin/bash

# Because pkexec can't export 
_run_mkarchiso() {
  local _gnupg_homedir="${1}"
  local _dest="${2}"
  local _pgp_key_id="${3}"
  local _pgp_sender="${4}"
  local _work_dir="${5}"
  local _profile="${6}"
  local _quiet="${7}"
  local _quiet_args=()
  if [[ "${_quiet}" != "y" ]]; then
    _quiet_args=('-v')
  fi
  export GNUPGHOME="${_gnupg_homedir}"
  chown -R 0:0 "${_gnupg_homedir}"
  env GNUPGHOME="${_gnupg_homedir}" /usr/bin/mkarchiso \
                                    -o "${_dest}" \
                                    -g "${_pgp_key_id}" \
                                    -G "${_pgp_sender}" \
				    -H "${_gnupg_homedir}" \
                                    -w "${_work_dir}" \
				    "${_quiet_args[@]}" "${_profile}"
}

gnupg_homedir="${1}"
dest="${2}"
pgp_key_id="${3}"
pgp_sender="${4}"
work_dir="${5}"
profile="${6}"
quiet="${7}"

GNUPGHOME="${gnupg_homedir}" _run_mkarchiso "${gnupg_homedir}" "${dest}" "${pgp_key_id}" \
	                                    "${pgp_sender}" "${work_dir}" "${profile}" "${quiet}"
