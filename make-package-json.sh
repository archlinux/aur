#! /bin/bash
me=${0##*/}

usage='SYNOPSIS

    '"$me"' [OPTIONS] [X.X.X[-next.HHHHHHHH...]]

Output (to stdout) JSON suitable as a package.json for building theia-electron.
Requires curl, jq, and diff.

The "X.X.X*" is the Theia version to use (without "v").
If omitted, the most recent release version is used.
If the version contains "-next.", the following part must be a commit id
with at least 8 hexdigits identifying a non-release version.

PLUGIN CONFIGURATION

If a file "extra-plugins.json" exists in the current directory,
it shall contain a JSON string-to-string map with entries like

    "vscode-builtin-theme-solarized-light": "vscode.theme-solarized-light",

The key is the plugin name for the Theia installation,
the value is the VSX name which is used to download the plugin.
The VSX name must contain exactly one dot, surrounded by other characters.
Neither name is allowed to contain characters that need URI escaping.

If the VSX name is empty, the plugin is removed from the plugin list.

The VSX name may be followed by "=" and a version (without "v") to use.
Otherwise, the VSX default (stable) version is used unless the plugin
name (the key, not the VSX name) begins with "vscode-builtin-". In that case,
the autodetected Theia API compatibility version is tried first.

OPTIONS

  -h, --help
    Output this usage information and exit.

  -v LEVEL, --verbosity=LEVEL
    Set the verbosity level for messages to stderr. LEVEL can be:

      * error: Only output errors
      * warn: Also output warnings
      * info: Also output progress information
      * debug: Output gory details

  -c FILE, --config=FILE
    Read extra plugins configuration from FILE if it exists.
    Default for FILE is "extra-plugins.json".

EXIT STATUS

Nonzero in case of errors, zero otherwise.'

set -o pipefail
shopt -s lastpipe
n=$'\n'
((errors=0))
verbosity=info
extra_plugins_file="extra-plugins.json"

log() {
  echo >&2 "// $me:" "$@"
}

debug() {
  case $verbosity in (debug) log "Debug:" "$@" ;; esac
}

info() {
  case $verbosity in (debug|info) log "Info:" "$@" ;; esac
}

warn() {
  case $verbosity in (debug|info|warn) log "Warning:" "$@" ;; esac
}

error() {
  log "Error:" "$@"
  ((++errors))
}

fatal() {
  log "Fatal:" "$@"
  exit 1
}

have() {
  type -p "$1" >/dev/null
}

get() {
  debug GET "${@:$#}"
  curl -LsS "$@"
}

# Handle options
while [ $# -gt 0 ]; do
  case $1 in
  (-h|--help)
    echo "$usage"
    exit ;;
  (--verbosity=*)
    verbosity=${1#*=}
    shift ;;
  (-v|--verbosity)
    [ $# -gt 1 ] || fatal "Option $1 requires an argument"
    shift
    verbosity=$1
    shift ;;
  (--config=*)
    extra_plugins_file=${1#*=}
    shift ;;
  (-c|--config)
    [ $# -gt 1 ] || fatal "Option $1 requires an argument"
    shift
    extra_plugins_file=$1
    shift ;;
  (-?*)
    fatal "Unknown option ${1@Q}" ;;
  (*) [ $# = 1 ] || fatal "Only one non-option argument supported"
    break ;;
  esac
done

case $verbosity in
(error|warn|info|debug) ;;
(*) fatal "Unknown verbosity ${verbosity@Q}" ;;
esac

# Test for tools
have jq         || fatal "Command jq not found."
have curl       || fatal "Command curl not found."
have diff       || fatal "Command diff not found. Install diffutils."

# Set Theia version
theia_version=$1
case $theia_version in (v[0-9]*)
  theia_version=${theia_version#v} ;;
esac

# Syntax-check the release part of the version, if nonempty
theia_release_version=${theia_version%%-next.*}
case $theia_release_version in
(*[^0-9.]*|.*|*..*|*.)
  fatal "Malformed version: ${theia_version@Q}" ;;
(*.*.*.*)
  fatal "Version ${theia_release_version@Q} has more than three dot-separated components" ;;
(*.*.*) ;;
(?*)
  fatal "Version ${theia_release_version@Q} has less than three dot-separated components" ;;
esac

# Extract and syntax-check Theia commit, if specified
theia_commit=""
case $theia_version in
(*-next.*)
  theia_commit=${theia_version#*-next.}
  case $theia_commit in
  (*[^0-9a-fA-F]*)
    fatal "Non-hexdigits in commit part ${theia_commit@Q}" ;;
  (????????*) ;;
  (*)
    fatal "Commit part ${theia_commit@Q} has less than 8 hexdigits" ;;
  esac
  theia_commit=${theia_commit@L} ;;
esac

# Load and syntax-check plugin config file
extra_plugins=""
if test -f "$extra_plugins_file"; then
  info "Reading plugin configuration from $extra_plugins_file"
  extra_plugins=$(jq -S 'select((objects|map_values(strings
|select(test("^([^/.=]+\\.[^/.=]+(=[^/]*)?)?$"))))
== . or error(""))' "$extra_plugins_file") \
  || error "$extra_plugins_file: Must contain JSON object with string values
either empty or of the form namespace.name[=version]"
  debug "extra plugins:
$extra_plugins"
fi

info "Retrieving Theia release versions"
tags_url="https://api.github.com/repos/eclipse-theia/theia/tags"
tags_list=$(get "$tags_url") \
|| fatal "Cannot retrieve Theia release versions"

info "Querying newest release version"
newest_release_tag=$(jq -re <<<"$tags_list" \
'map(.name|select(test("^v[1-9][.0-9]+$")))|.[0]') \
|| fatal "Cannot query newest release version"
debug "Newest release tag: $newest_release_tag"

if [ -n "$theia_version" ]; then
  theia_release_tag=v$theia_release_version

  info "Checking for updates"
  case $theia_version in
  (*-next.*)
    # Check if release part (without -next.*) is available already
    if jq -e <<<"$tags_list" >/dev/null \
      'map(.name == "'"$theia_release_tag"'") | any'; then
      info "Next release $theia_release_tag is available already"
    else
      info "Next release $theia_release_tag is not available yet"
    fi
    ;;
  (*)
    # Check if the specified version is the latest released one
    if [ "$theia_release_tag" = "$newest_release_tag" ]; then
      info "Specified release $theia_release_tag matches the latest release"
    else
      info "Specified release $theia_release_tag does not match the latest release $newest_release_tag"
    fi ;;
  esac
else
  theia_release_tag=$newest_release_tag
  theia_version=${theia_release_tag#v}
  info "Setting Theia version to $theia_version"
fi

if [ -n "$theia_commit" ]; then
  commit_url=https://api.github.com/repos/eclipse-theia/theia/commits/$theia_commit
else
  info "Extracting Theia commit URL"
  commit_url=$(jq -re <<<"$tags_list" \
  'map(select(.name=="'"$theia_release_tag"'"))|.[0].commit.url') \
  || fatal "Cannot extract Theia commit URL. Nonexisting version tag perhaps?"
fi
debug "Commit URL: $commit_url"

info "Retrieving commit data"
commit_data=$(get "$commit_url" | jq -S \
'{sha, tree: .commit.tree} | map_values(values)') \
|| fatal "Cannot retrieve commit data"
debug "Commit data: $commit_data"

info "Extracting complete commit id"
theia_commit_full=$(jq -re <<<"$commit_data" '.sha') \
|| fatal "Cannot extract complete commit id"
debug "Complete commit id: $theia_commit_full"

# Sanity check: The full commit id has the specified one (if any) as prefix.
case $theia_commit_full in
("$theia_commit"*) ;;
(*) fatal "Wrong commit id. This is a bug." ;;
esac

# Normalize Theia version
theia_commit=$theia_commit_full
case $theia_version in (*-next.*)
  theia_version=$theia_release_version-next.${theia_commit:0:8} ;;
esac

info "Extracting tree URL"
tree_url=$(jq -re <<<"$commit_data" '.tree.url') \
|| fatal "Cannot extract tree URL"
debug "Tree URL: $tree_url"

info "Retrieving packages URL"
packages_url=$(get "$tree_url" \
| jq -re '.tree[]|select((.path=="packages") and (.type=="tree"))|.url') \
|| fatal "Cannot retrieve packages URL"
debug "Packages URL: $packages_url"

info "Assembling @theia/* dependencies from packages/*"
theia_deps=$(get "$packages_url" \
| jq -S '.tree
|map(select(.type=="tree")|.path)|[.[], "electron"]
|map({key: ("@theia/"+.), value: "'"$theia_version"'"})
|from_entries') \
|| fatal "Cannot retrieve and process packages/* list"

# URL prefix for raw content requests
raw_url_prefix="https://github.com/eclipse-theia/theia/raw/$theia_commit"

info "Retrieving toplevel package.json"
toplevel_package_json=$(get "$raw_url_prefix/package.json") \
|| fatal "Cannot retrieve toplevel package.json"

info "Retrieving examples/electron/package.json"
electron_package_json=$(get "$raw_url_prefix/examples/electron/package.json") \
|| fatal "Cannot retrieve examples/electron/package.json"

info "Retrieving VSCODE_DEFAULT_API_VERSION"
version_file="packages/plugin-ext-vscode/src/common/plugin-vscode-types.ts"
vscode_default_api_version=$(get "$raw_url_prefix/$version_file" | sed -n -E \
's/^.* VSCODE_DEFAULT_API_VERSION *= *(["'"'"'])([^"'"'"']*)\1;$/\2/p')
[ -n "§vscode_default_api_version" ] \
|| fatal "Cannot retrieve VSCODE_DEFAULT_API_VERSION"
info "VSCODE_DEFAULT_API_VERSION = $vscode_default_api_version"

info "Checking dependencies for consistency"
# Check names only, not versions, as those *will* differ for *-next.* versions
diff=$(diff -U0 <(jq -S <<<"$electron_package_json" \
'.dependencies|map_values("'"$theia_version"'")') \
- <<<"$theia_deps" | tail +3) \
|| warn "Dependency discrepancy:
--- from examples/electron/package.json
+++ from packages/* (plus @theia/electron)
$diff
Notes:
  * @theia/api-samples should be left out (not published)
  * @theia/plugin{,-metrics} might be indirect dependencies
Proceeding with dependencies assembled from packages/* (plus @theia/electron)"

info "Extracting names of official plugins from toplevel package.json"
plugins=$(jq -S <<<"$toplevel_package_json" '.theiaPlugins
|map_values(split("/")|.[4:6]|join("."))') \
|| fatal "Cannot extract names of official plugins"

if test -n "$extra_plugins"; then
  info "Merging plugin configuration from $extra_plugins_file"
  plugins=$(jq -S <<<"$plugins" \
  '(. + '"$extra_plugins"')|map_values(select(. != ""))') \
  || fatal "Cannot merge plugin configuration from $extra_plugins_file"
else
  info "Skipping extra plugin configuration due to missing or erroneous $extra_plugins_file"
fi
debug "Consolidated plugins:
$plugins"

info "Retrieving plugin download URLs"
theia_plugins=""
jq -r <<<"$plugins" 'to_entries[]
|[(.key|@uri|@json), (.value|split("=")|(.[0], (.[1:]|join("=")))|@uri)]
|join(" ")' \
| while read -r key fullname version; do
  vsxv=$fullname${version:+=$version}
  if [[ $fullname =~ ^([^.]+)\.([^.]+)$ ]]; then
    namespace=${BASH_REMATCH[1]}
    name=${BASH_REMATCH[2]}
    url="https://open-vsx.org/api/$namespace/$name/"
    versions_to_try=("$version")
    if [ -z "$version" ]; then
      case $key in (\"vscode-builtin-*)
        # Try $vscode_default_api_version first
        versions_to_try=("$vscode_default_api_version" "$version") ;;
      esac
    fi
    for v in "${versions_to_try[@]}"; do
      vurl=$url$v
      download=$(get "$vurl" | jq '.files.download | values')
      if [ -n "$download" ]; then break; fi
    done
    if [ -z "$download" ]; then
      error "Cannot query plugin ${vsxv@Q}, skipped"
      continue
    fi
    [ -z "$theia_plugins" ] || theia_plugins+=",$n"
    theia_plugins+="  $key: $download"
  else
    error "Malformed VSX name ${vsxv@Q}, skipped"
    continue
  fi
done
theia_plugins="{$n$theia_plugins$n}"

# Indent two more spaces
theia_plugins=${theia_plugins//"$n"/"$n  "}
theia_deps=${theia_deps//"$n"/"$n  "}
info "Generating output for package.json"
cat <<EOF || error "error writing to stdout"
{
  "private": true,
  "version": "$theia_version",
  "main": "src-gen/frontend/electron-main.js",
  "license": "EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0",
  "theia": {
    "target": "electron",
    "frontend": {
      "config": {
        "applicationName": "Theia"
      }
    }
  },
  "theiaPluginsDir": "plugins",
  "theiaPlugins": $theia_plugins,
  "dependencies": $theia_deps,
  "devDependencies": {
    "@theia/cli": "$theia_version"
  },
  "scripts": {
    "build": "electron-rebuild && theia download:plugins && theia build --mode production",
    "start": "theia start"
  }
}
EOF

# Exit with appropriate status
((!errors))

