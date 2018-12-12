# Functions for interacting with the build environment

function initialize_build_environment() {
  local directory="$1"; shift

  if [[ -z "${directory}" ]]; then
    mkdir -p "${PATH_BUILD}"
    mkarchroot -C /etc/pacman.conf "${PATH_BUILD}/root" base-devel
  else
    if [[ "${directory:0:1}" = "/" ]]; then
      mkdir -p "${directory}"
      mkarchroot -C /etc/pacman.conf "${directory}/root" base-devel
    else
      echo "Path is invalid"
    fi
  fi
}