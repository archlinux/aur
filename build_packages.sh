# Functions for building packages

# Build a single package from a repository
# or all packages within repository
# Calling this function with no parameters
# build all packages within repository
function build_package() {
  local repository_name="$1"; shift
  local package_name="$1"; shift

  if [[ ! -d "${PATH_REPOSITORIES}/${repository_name}/src" ]]; then
    echo "The repository ${repository_name} does not have packages that need to be built."
    return
  fi

  if [[ ! -z "${package_name}" ]]; then
    # build a package from the specified repository
    if [[ ! -d "${PATH_REPOSITORIES}/${repository_name}/src/${package_name}" ]]; then
      echo "The repository ${repository_name} does not have a buildable package named ${package_name}."
      return
    else
      local previous_wd="$(pwd)"

      cd "${PATH_REPOSITORIES}/${repository_name}/src/${package_name}"
      makechrootpkg -cur "${PATH_BUILD}"

      repo-add "${PATH_REPOSITORIES}/${repository_name}/${LOCAL_DB_FILE}" *.pkg.tar.xz

      cp *.pkg.tar.xz "${PATH_REPOSITORIES}/${repository_name}/pkg/"

      cd "${previous_wd}"
    fi
  else
    # build all packages from the specified repository
    echo "Building all packages from ${repository_name}.."

    for packagename in "${PATH_REPOSITORIES}/${repository_name}/src/*"; do
      bash repotools -B "$(basename ${packagename}) ${repository_name}"
    done 
  fi
}

# Build all packages from all repositories
function build_all_packages() {
  echo "Building all packages from all repositories.." 

  for reponame in "${PATH_REPOSITORIES}/*"; do
      bash repotools -b "$(basename ${reponame})"
  done 
}