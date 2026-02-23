#!/usr/bin/env fish

set pkgbuild_path (dirname (status filename))/PKGBUILD

function get_version_by_platform --argument-names platform_id
    set full_url "https://www.feishu.cn/api/package_info?platform=$platform_id"

    # Fetch JSON from API
    set response (curl -s -H 'User-Agent: Mozilla/5.0' "$full_url")

    # Extract download_link and md5 using jq
    set download_link (echo $response | jq -r '.data.download_link')
    set expect_md5 (echo $response | jq -r '.data.hash')

    set filename (string replace -r '.*\/([^\/]*?\.deb).*' '$1' $download_link)
    set pkgver (string replace -r '.*-(\d+\.\d+\.\d+)\.deb.*' '$1' $download_link)
    set pkghash (string replace -r '.*\/([^\/]*?)\/Feishu-linux_.*' '$1' $download_link)

    # Download the file into a temp dir (avoid polluting repo with huge .deb files)
    set tmpdir (mktemp -d)
    set destfile "$tmpdir/$filename"
    echo "Downloading $download_link to $destfile..." >&2
    axel -o $destfile "$download_link" >&2

    # Verify MD5 before calculating SHA256
    set actual_md5 (md5sum $destfile | cut -d' ' -f1)
    if test "$actual_md5" != "$expect_md5"
        echo "MD5 mismatch! Expected: $expect_md5, Got: $actual_md5" >&2
        exit 1
    end
    echo "MD5 verified: $actual_md5" >&2

    set sha256hash (sha256sum $destfile | cut -d' ' -f1)

    # Cleanup temp file/dir
    rm -f $destfile
    rmdir $tmpdir

    echo $pkgver
    echo $pkghash
    echo $sha256hash
end

# Fetch x64 info
echo "Fetching x64 info..." >&2
set x64_info (get_version_by_platform 10)
set pkgver $x64_info[1]
set pkghash_x64 $x64_info[2]
set sha256_x64 $x64_info[3]

# Fetch arm64 info
echo "Fetching arm64 info..." >&2
set arm64_info (get_version_by_platform 12)
set pkghash_arm64 $arm64_info[2]
set sha256_arm64 $arm64_info[3]

echo "Updating PKGBUILD with:" >&2
echo "  pkgver=$pkgver" >&2
echo "  _pkghash_x64=$pkghash_x64" >&2
echo "  _pkghash_arm64=$pkghash_arm64" >&2
echo "  sha256sums_x86_64=$sha256_x64" >&2
echo "  sha256sums_aarch64=$sha256_arm64" >&2

# Update PKGBUILD using sed
sed -i "s/^pkgver=.*/pkgver=$pkgver/" $pkgbuild_path
sed -i "s/^_pkghash_x64=.*/_pkghash_x64=$pkghash_x64/" $pkgbuild_path
sed -i "s/^_pkghash_arm64=.*/_pkghash_arm64=$pkghash_arm64/" $pkgbuild_path
sed -i "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('$sha256_x64')/" $pkgbuild_path
sed -i "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('$sha256_arm64')/" $pkgbuild_path

echo "PKGBUILD updated successfully!" >&2
makepkg --printsrcinfo > .SRCINFO
echo ".SRCINFO updated successfully!" >&2

# Optionally skip git operations (automation may want centralized commit/push)
set no_git 0
if test (count $argv) -ge 1
    if test "$argv[1]" = "--no-git"
        set no_git 1
    end
end

if test $no_git -eq 0
    git add PKGBUILD .SRCINFO
    git commit -m "chore: update to $pkgver"
    git log -1 --pretty=fuller
else
    echo "--no-git: skip git add/commit" >&2
end
