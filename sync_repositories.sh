# Functions for syncing repositories with the remote

function sync_with_remote() {
  local repository_name="$1"; shift

  if [[ ! -z "${repository_name}" ]]; then
    # sync a single repository

    if [[  -z "${LOCAL_REMOTE_REPO_ADDRESS}" ]]; then
      echo "The repository ${repository_name} does not have a remote git address configured."
      return
    fi

    git --work-tree="${PATH_REPOSITORIES}/${repository_name}/" --git-dir="${PATH_REPOSITORIES}/${repository_name}/.git" remote update

    git --work-tree="${PATH_REPOSITORIES}/${repository_name}/" --git-dir="${PATH_REPOSITORIES}/${repository_name}/.git" add .
    
    git --work-tree="${PATH_REPOSITORIES}/${repository_name}/" --git-dir="${PATH_REPOSITORIES}/${repository_name}/.git" commit -a -m "$(date)"

    local upstream=${1:-'@{u}'}
    local local_status=$(git --work-tree=${PATH_REPOSITORIES}/${repository_name}/ --git-dir=${PATH_REPOSITORIES}/${repository_name}/.git rev-parse @)
    local remote_status=$(git --work-tree=${PATH_REPOSITORIES}/${repository_name}/ --git-dir=${PATH_REPOSITORIES}/${repository_name}/.git rev-parse "$upstream")
    local base_status=$(git --work-tree=${PATH_REPOSITORIES}/${repository_name}/ --git-dir=${PATH_REPOSITORIES}/${repository_name}/.git merge-base @ "$upstream")

    if [ $local_status == $remote_status ]; then
      echo "The repository ${repository_name} is up to date."
    elif [ $local_status == $base_status ]; then
      echo "${repository_name} is not up to date with the remote, pulling the changes.."
      git --work-tree="${PATH_REPOSITORIES}/${repository_name}/" --git-dir="${PATH_REPOSITORIES}/${repository_name}/.git" pull 
    elif [ $remote_status == $base_status ]; then
      echo "${repository_name} is ahead of the remote, pushing the changes.."            
      git --work-tree="${PATH_REPOSITORIES}/${repository_name}/" --git-dir="${PATH_REPOSITORIES}/${repository_name}/.git" push 
    else
      echo "${repository_name} and the remote are diverged."
    fi
  else
    # sync all repositories
    echo "Syncing all repositories."
    for reponame in "${PATH_REPOSITORIES}/*"; do
      bash repotools -S "$(basename ${reponame})"
    done
  fi
}