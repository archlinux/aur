# Utilities

function source_pkg_config() {

  local repository_name="$1"; shift

  if [[ ! -f "${PATH_REPOSITORIES}/${repository_name}/.config" ]]; then
    echo "The repository ${repository_name} has no config file."
    exit 1
  fi

  source "${PATH_REPOSITORIES}/${repository_name}/.config"
}

function remove_tmp_files() {
  rm "${PATH_REPOSITORIES}"/*.tmp
}