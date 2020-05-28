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

getsemverspec() {
  local dep="$1"
  local semverspec="$(echo "$dep" | gawk -F'@' '{ print $NF }')"
  echo "$semverspec"
}

getpackagename() {
  local dep="$1"
  local semverspec="$2"
  local package="${dep//@$semverspec}"
  echo "$package"
}

# move from $depspath or download deps to the $targetdepspath
# save info in sourcelist sha1sumslist noextractlist files
onlinebestmatch() {
  local package="$1";
  local semverspec="$2";

  if echo "$semverspec" | grep -q '/'; then
    local fullname="${package}-$(echo "$semverspec" | cut -d/ -f1 | gawk -F'github:' '{ print $2; }').zip"
    if [ -f "$depspath/$fullname" ]; then
      mv "$depspath/$fullname" "$targetdepspath/"
    elif [ ! -f "$targetdepspath/$fullname" ]; then
      echo "The $package [version = $semverspec] must be downloaded manually from github to continue."
      exit -1;
    fi
    echo "$fullname"
  else
    local json="$(npm view --json "$package@$semverspec")"
    if [ $(echo "$json" | jq -r '.version? // "INVALID"') = "INVALID" ]; then
      json=$(echo "$json" | jq '.[0]')
    fi
    local version="$(echo "$json" | jq -r '.version' | head -n1)"

    local latestversion="$(echo "$json" | jq '.versions | .[]' | xargs semver -r "$semverspec" | tail -n1)"
    if [ "$version" != "$latestversion" ]; then
      json="$(npm view --json "$package@$latestversion")"
    fi

    local url=$(echo $json | jq -r '.dist.tarball');
    local shasum=$(echo $json | jq -r '.dist.shasum');
    local name="${package/\//\#}-${latestversion}.tgz"

    if ! grep -q "$shasum" "$targetdepspath/sha1sumslist"; then
      if echo "$package" | grep -q "/"; then
        echo "$name::$url" >> "$targetdepspath/sourcelist"
      else
        echo "$url" >> "$targetdepspath/sourcelist"
      fi
      echo "$shasum" >> "$targetdepspath/sha1sumslist"
      echo "$name" >> "$targetdepspath/noextractlist"
      if [ -f "$depspath/$name" ]; then
        mv "$depspath/$name" "$targetdepspath/"
      else
        cd "$targetdepspath/"
        wget -O "$name" "$url"
      fi
    fi
    echo "$name"
  fi
}

recursivedownloaddeps() {
  local target="$1"
  if [ -d "$tmpbuildpath/$target" ]; then
    echo "Downloading dependency $target [cached]"
  else
    echo "Downloading dependency $target (recursively) ..."
    mkdir -p "$tmpbuildpath/$target"
    cd "$tmpbuildpath/$target"
    if [ "${target: -4}" = ".zip" ]; then
      unzip "$targetdepspath/${target}"
    else
      bsdtar xzf "$targetdepspath/${target}"
    fi
    folder=$(ls)
    find "$folder" -mindepth 1 -maxdepth 1 | xargs mv -t .
    rm -r "$folder"
    cat package.json | jq -r '.dependencies | to_entries? | map(.key + "@" + .value) | .[]' | while read dep; do
      local semverspec="$(getsemverspec "$dep")"
      local package="$(getpackagename "$dep" "$semverspec")"
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
    local semverspec="$(getsemverspec "$dep")"
    local package="$(getpackagename "$dep" "$semverspec")"
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

# sorting entries...
cd "$targetdepspath/"
cat sourcelist | gawk '{ n=n+1; print n, $0; }' > a
cat sha1sumslist | gawk '{ n=n+1; print n, $0; }' > b
cat noextractlist | gawk '{ n=n+1; print n, $0; }' > c
cat c | gawk '{ print $2, $1 }' | sort | gawk '{ n=n+1; print $2, n; }' | sort --numeric-sort | gawk '{ print $2 }' > order
paste order a | sort --numeric-sort | gawk '{ print $3 }' > aaa
paste order b | sort --numeric-sort | gawk '{ print $3 }' > bbb
paste order c | sort --numeric-sort | gawk '{ print $3 }' > ccc
createlist source aaa > threelists
createlist sha1sums bbb >> threelists
createlist noextract ccc >> threelists

#createlist source sourcelist > threelists
#createlist sha1sums sha1sumslist >> threelists
#createlist noextract noextractlist >> threelists

