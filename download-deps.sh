# This script auto detects dependencies versions and downloads them.
# It can be used to update the PKGBUILD sources.
# It moves existing dependencies from $depspath to $targetdepspath
# and downloads non-existing ones in $targetdepspath

packagejsonpath="$(realpath "$1")"
if [ ! -f "$packagejsonpath" ]; then
  echo "Usage: $0 <path of the main package.json file>"
  exit -1
fi

depspath="$(pwd)"

rm -rf tmp-deps-build deps
mkdir tmp-deps-build deps
tmpbuildpath="$(realpath tmp-deps-build)"

targetdepspath="$depspath/deps"

# move from $depspath or download deps to the $targetdepspath
# save info in sourcelist sha1sumslist noextractlist files
onlinebestmatch() {
  local package="$1";
  local semverspec="$2";

  local json="$(npm view --json "$package@$semverspec")"
  local version="$(echo "$json" | jq -r '.version')"
  local latestversion="$(echo "$json" | jq '.versions | .[]' | xargs semver -r "$semverspec" | tail -n1)"
  if [ "$version" != "$latestversion" ]; then
    json="$(npm view --json "$package@$latestversion")"
  fi

  local url=$(echo $json | jq -r '.dist.tarball');
  local shasum=$(echo $json | jq -r '.dist.shasum');
  local name=$(echo "$url" | gawk -F'/' '{ print $NF }')

  if ! grep -q "$shasum" "$targetdepspath/sha1sumslist"; then
    echo "$url" >> "$targetdepspath/sourcelist"
    echo "$shasum" >> "$targetdepspath/sha1sumslist"
    echo "$name" >> "$targetdepspath/noextractlist"
    if [ -f "$depspath/$name" ]; then
      mv "$depspath/$name" "$targetdepspath/"
    else
      cd "$targetdepspath/"
      wget "$url"
    fi
  fi
  echo "$name"
}

recursivedownloaddeps() {
  local target="$1"
  if [ -d "$tmpbuildpath/$target" ]; then
    echo "Downloading dependency $target [cached]"
  else
    echo "Downloading dependency $target (recursively) ..."
    mkdir -p "$tmpbuildpath/$target"
    cd "$tmpbuildpath/$target"
    bsdtar xzf "$targetdepspath/${target}"
    folder=$(ls)
    find "$folder" -mindepth 1 -maxdepth 1 | xargs mv -t .
    rm -r "$folder"
    cat package.json | jq -r '.dependencies | to_entries? | map(.key + "@" + .value) | .[]' | while read dep; do
      local package="$(echo "$dep" | gawk -F'@' '{ print $1 }')"
      local semverspec="$(echo "$dep" | gawk -F'@' '{ print $2 }')"
      if [ ! -d "$tmpbuildpath/${target}/node_modules/$package" ]; then
        local subtarget="$(onlinebestmatch "$package" "$semverspec")"
        recursivedownloaddeps "$subtarget"
      fi
    done
  fi
}


downloaddeps() {
  cd "$tmpbuildpath"
  cat "$packagejsonpath" | jq -r '.dependencies, .devDependencies | to_entries? | map(.key + "@" + .value) | .[]' | sort -u | while read dep; do
    local package="$(echo "$dep" | gawk -F'@' '{ print $1 }')"
    local semverspec="$(echo "$dep" | gawk -F'@' '{ print $2 }')"
    local target="$(onlinebestmatch "$package" "$semverspec")"
    recursivedownloaddeps "$target"
  done
}

createlist() {
  local arrname="$1"
  local filename="$2"
  echo "${arrname}+=("
  cat "$filename" | sed 's/^/  "/' | sed 's/$/"/'
  echo "  )"
}

downloaddeps

createlist source sourcelist > threelists
createlist sha1sums sha1sumslist >> threelists
createlist noextract noextractlist >> threelists

