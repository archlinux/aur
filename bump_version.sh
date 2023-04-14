#!/usr/bin/env sh

get_latest_release_tag() {
  # Resolve latest release tag from the GitHub API
  curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

sha512sum_first_src_sum() {
  # Resolve PKGBUILD vars
  local url=$(cat PKGBUILD | grep "url=" | sed -E 's/.*"([^"]+)".*/\1/')
  local pkgbin=$(echo $url | sed -E 's,.*https://github.com/([^$]+),\1,')
  local pkgver=$(get_latest_release_tag $pkgbin)
  local pkgsrc=$(cat PKGBUILD | grep "_pkgsrc=" | sed -E 's/.*"([^"]+)".*/\1/' | sed -E 's/\$\{pkgver\}/'"$pkgver"'/g')

  # Replace pkgver
  sed -Ei "s/pkgver=.*\$/pkgver="'"'"$(get_latest_release_tag $pkgbin)"'"'"/g" PKGBUILD

  # Calculate sum on first in source()
  wget "$url/releases/download/$pkgver/$pkgsrc"
  local sha=$(sha512sum $pkgsrc | cut -d " " -f1)
  rm $pkgsrc
  echo $sha
}

# Replace first sha512sum
sha=$(sha512sum_first_src_sum)
echo "NEW SUM: $sha"
sed -Ei 's/sha512sums=\(\"([0-9a-f]*)\"/sha512sums=\("'"$sha"'"/' PKGBUILD

# Resolve .SRCINFO
makepkg --printsrcinfo > .SRCINFO
