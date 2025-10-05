set -e

fetch_dep() {
  local dep_file="$1"

  # Ensure the file exists
  if [[ ! -f "$dep_file" ]]; then
    echo "Dependency file not found: $dep_file"
    return 1
  fi

  # Extract each field by key
  name=$(grep '^name' "$file" | sed -E 's/^name *= *"(.*)"/\1/')
  remote=$(grep '^remote' "$file" | sed -E 's/^remote *= *"(.*)"/\1/')
  branch=$(grep '^branch' "$file" | sed -E 's/^branch *= *"(.*)"/\1/')
  revision=$(grep '^revision' "$file" | sed -E 's/^revision *= *"(.*)"/\1/')

  # Output the parsed variables
  local target_dir="extern/$name"
  # Get version string (e.g., "git version 2.50.1")
  version_str=$(git --version)

  # Extract the major and minor version numbers using regex
  # e.g., 2 and 50 from "git version 2.50.1"
  if [[ $version_str =~ ([0-9]+)\.([0-9]+)\.[0-9]+ ]]; then
    gitMajor="${BASH_REMATCH[1]}"
    gitMinor="${BASH_REMATCH[2]}"

    # Now perform the version check
    if [[ "$gitMajor" -ge 3 || ( "$gitMajor" -eq 2 && "$gitMinor" -ge 49 ) ]]; then
      git clone --depth=1 --revision $revision $remote $target_dir
    else
      git clone --depth=1 --branch $branch $remote $target_dir
    fi
  else
    echo "Could not parse Git version from: $version_str"
    exit 1
  fi
}

# Download dependencies from the tune files
find "extern" -mindepth 1 ! -name "*.tune" -prune -exec rm -rf {} +

for file in extern/*.tune; do
  if [[ -f "$file" ]]; then
    echo "Fetching dependency from: $(basename "$file")"
    fetch_dep "extern/$(basename "$file")"
  fi
done
