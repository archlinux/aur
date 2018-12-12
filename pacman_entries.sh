# Functions for generating pacman entries for repositories

function generate_pacman_entry() {
  local repository_name="$1"; shift

  if [[ ! -z "${repository_name}" ]]; then
    # generate the entry for a single package
    echo "[${LOCAL_REPOSITORY_NAME}]"
    echo "SigLevel = Optional TrustAll"
    echo "Server = ${LOCAL_REMOTE_PACKAGE_DIR}/"
    echo 
  else
    # generate the entry for all packages
    for reponame in "${PATH_REPOSITORIES}/*"; do
      bash repotools -G "$(basename ${reponame})"
    done 
  fi
}