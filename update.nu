git pull | ignore

let pkgbuild_file = open "PKGBUILD"
let current_version = $pkgbuild_file | lines | parse "pkgver={version}" | $in.0.version

let latest_release = http get "https://api.github.com/repos/apple/foundationdb/releases/latest"
let latest_version = $latest_release.tag_name

if $current_version == $latest_version {
    print "Package is up to date."
    exit 0
}

print "Updating package"

let current_source_hash = $pkgbuild_file | lines | parse "sha256sums_x86_64=('{hash}')" | $in.0.hash

let latest_source_url = $latest_release.assets | where name == "fdbcli.x86_64.sha256" | $in.0.browser_download_url
let latest_source_hash = http get $latest_source_url | decode | str substring ..63

let pkgbuild_file = $pkgbuild_file | str replace $current_version $latest_version
let pkgbuild_file = $pkgbuild_file | str replace $current_source_hash $latest_source_hash

$pkgbuild_file | save -f "PKGBUILD"

git commit --all --message $"bump to ($latest_version)" | ignore
git push | ignore
