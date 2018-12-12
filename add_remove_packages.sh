# Functions for adding and removing packages from repositories

# Add a package to the specified repository
function add_package() {
  local repository_name="$1"; shift
  local package_name="$1"; shift

  aursync --repo "${repository_name}" --root "${PATH_REPOSITORIES}/${repository_name}/pkg/" "${package_name}"
}

# Remove a package from the specified repository
function remove_package() {
  local repository_name="$1"; shift
  local package_name="$1"; shift

  local previous_wd="$(pwd)"

  cd "${PATH_REPOSITORIES}/${repository_name}"

  repo-remove "${PATH_REPOSITORIES}/${repository_name}/${LOCAL_DB_FILE}" "${package_name}"

  rm "${PATH_REPOSITORIES}/${repository_name}/pkg/${package_name}-*.pkg.tar.xz"

  cd "${previous_wd}"
}