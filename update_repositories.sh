# Functions for updating repositories

function update_repository() {
  local repository_name="$1"; shift

  if [[ ! -z "${repository_name}" ]]; then
    # update a single repository
    aursync --repo "$LOCAL_REPOSITORY_NAME" --root "$PATH_REPOSITORIES/${repository_name}/pkg" -u
  else
    # update all repositories
    for reponame in "${PATH_REPOSITORIES}/*"; do
      bash repotools -U "$(basename ${reponame})"
    done
  fi
}