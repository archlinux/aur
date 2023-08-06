#!/usr/bin/bash

# Because pkexec can't export 
_run_mkarchiso() {
  local _pacman_conf="${1}" \
        _gnupg_homedir="${2}" \
        _dest="${3}" \
        _pgp_key_id="${4}" \
        _pgp_sender="${5}" \
        _work_dir="${6}" \
        _profile="${7}" \
        _quiet="${8}" \
	_archiso_opts=() \
	_quiet_args=()
  _archiso_opts=(
    -C "${_pacman_conf}"
    -o "${_dest}"
    -g "${_pgp_key_id}"
    -G "${_pgp_sender}"
    -H "${_gnupg_homedir}"
    -w "${_work_dir}")

  [[ "${_quiet}" != "y" ]] && \
    _quiet_args=('-v')
  export GNUPGHOME="${_gnupg_homedir}"
  chown -R 0:0 \
	"${_gnupg_homedir}"

  env GNUPGHOME="${_gnupg_homedir}" \
    /usr/bin/mkarchiso "${_archiso_opts[@]}" \
                       "${_quiet_args[@]}" \
		       "${_profile}"
}

gnupg_homedir="${1}"
dest="${2}"
pgp_key_id="${3}"
pgp_sender="${4}"
work_dir="${5}"
profile="${6}"
quiet="${7}"

GNUPGHOME="${gnupg_homedir}" \
  _run_mkarchiso "${gnupg_homedir}" \
                 "${dest}" \
		 "${pgp_key_id}" \
	         "${pgp_sender}" \
		 "${work_dir}" \
		 "${profile}" \
		 "${quiet}"
