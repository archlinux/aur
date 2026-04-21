#!/usr/bin/env fish

set repo gitbutlerapp/gitbutler

echo "fetching latest release"
set release (curl -s "https://api.github.com/repos/$repo/releases/latest")
set ver     (echo $release | jq -r '.tag_name' | string replace 'release/' '')
set body    (echo $release | jq -r '.body')

set cur_ver (string match -r '(?<=^pkgver=).*' <PKGBUILD)
if test "$ver" = "$cur_ver"
  echo "already updated (v$ver)"
  exit 0
end

echo "updating: $cur_ver -> $ver"
sed -i "s/^pkgver=.*/pkgver=$ver/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/"    PKGBUILD

echo "updating changelog"
begin
  echo "[ $ver ]"
  echo ====================
  echo $body
  echo ""
  if test -f CHANGELOG
    cat CHANGELOG
  end
end >CHANGELOG.swp
mv CHANGELOG.swp CHANGELOG

echo "done! remember to updpkgsums"
