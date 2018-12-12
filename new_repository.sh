# Functions for creating a new repository

# Create a new repository
function new_repository() {
  local repository_name="$1"; shift

  if [[ -d "${PATH_REPOSITORIES}/${repository_name}" ]]; then
    echo "The repository already exists."
  else
    # create the repository directory
    mkdir "${PATH_REPOSITORIES}/${repository_name}"

    # create the pkg dir and the database
    mkdir "${PATH_REPOSITORIES}/${repository_name}/pkg"
    repo-add "${PATH_REPOSITORIES}/${repository_name}/pkg/${repository_name}.db.tar.xz"

    # create a folder for meta packages if required
    if [[ -z "${arg_new_repo}" ]]; then
      mkdir "${PATH_REPOSITORIES}/${repository_name}/src"
      echo "placeholder file" > "${PATH_REPOSITORIES}/${repository_name}/src/.placeholder"
    fi

    # create the config file
    touch "${PATH_REPOSITORIES}/${repository_name}/.config"
    
    echo "# Configuration file for the repository" >> "${PATH_REPOSITORIES}/${repository_name}/.config"
    echo
    echo "LOCAL_REPOSITORY_NAME=\"${repository_name}\"" >> "${PATH_REPOSITORIES}/${repository_name}/.config"
    echo "LOCAL_REMOTE_PACKAGE_DIR=\"insert url here\"" >> "${PATH_REPOSITORIES}/${repository_name}/.config"
    echo "LOCAL_DB_FILE=\"pkg/${repository_name}.db.tar.xz\"" >> "${PATH_REPOSITORIES}/${repository_name}/.config"
    echo "LOCAL_REMOTE_REPO_ADDRESS=\"insert url here\"" >> "${PATH_REPOSITORIES}/${repository_name}/.config"
# EOF 
    
    # edit the config file
    vim "${PATH_REPOSITORIES}/${repository_name}/.config"

    # create the gitignore file
    vim "${PATH_REPOSITORIES}/${repository_name}/.gitignore"

  fi
}

# Initialize the new repository
function new_repository_init() {
  local repository_name="$1"; shift

  bash "${PATH_REPOTOOLS}/repotools" -G "${repository_name}" > "${PATH_REPOSITORIES}/${repository_name}/pacman-entry.txt"

  local previous_wd="$(pwd)"

  cd "${PATH_REPOSITORIES}/${repository_name}"

  git init
  git add .
  git add .config
  git add .gitignore
  git commit -m "Initial config"

  git remote add origin "${LOCAL_REMOTE_REPO_ADDRESS}" 

  git push --set-upstream origin master

  cd "${previous_wd}"
}