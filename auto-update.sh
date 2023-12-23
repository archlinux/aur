#! /usr/bin/env bash
#
die() {
  echo "$@" >&2
  exit 1
}

## "https://github.com/eternnoir/pyTelegramBotAPI/releases/"
URL="https://api.github.com/repos/eternnoir/pyTelegramBotAPI/releases"

if [ -z "$GITHUB_TOKEN" ]; then
  die "Missing GITHUB_TOKEN to access API."
fi

temp_file=$(mktemp)
trap "rm -f $tempfile" 1 2 3 6 13 15
 # From example: https://docs.github.com/en/rest/releases/releases?apiVersion=2022-11-28#get-the-latest-release
curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  $URL/latest > $temp_file || \
  die "Failed to fetch data from latest release"

tag_name=$(jq -r .tag_name < $temp_file)
echo "tag_name: $tag_name"

current_tag=$(grep "^pkgver" PKGBUILD | cut -d= -f2)
echo "current_tag: $current_tag"

if [ "$current_tag" = "$tag_name" ];then
  echo "Same versions.  Nothing to be done."
  rm -f $temp_file
  exit 0
fi

cat $temp_file

echo "Updating AUR package to: $tag_name"
pkgname=$(grep "^_pkgname=" PKGBUILD | cut -d= -f2)
tarball_url="https://github.com/eternnoir/${pkgname}/archive/refs/tags/${tag_name}.tar.gz"
## sed part to remove windowze comments
release_message=$(jq -r .body < $temp_file | sed "s/\\\r//g")

echo "tarball_url: $tarball_url"
echo "release_message: $release_message"

echo "Downloading latest release"
curl -Lo $temp_file "$tarball_url" || \
  die "Failed to download latest release"
echo "Getting sha256 sum"
sha256=$(sha256sum $temp_file | cut -d' ' -f1)
echo "sha256: $sha256"

echo "Updating version into PKGBUILD"
sed -i "s/pkgver=.*/pkgver=$tag_name/" PKGBUILD || \
  die "Failed to update version into PKGBUILD"
echo "Updating hash into PKGBUILD"
sed -i "s/sha256sums=.*/sha256sums=\(\'$sha256\'\)/" PKGBUILD || \
  die "Failed to update sha256sum into PKGBUILD"

echo "Updating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO || \
  die "Failed to update .SRCINFO"

echo "Generating package"
makepkg || \
  die "Failed to generate package"

echo "Creating git commit message"
git commit -m "Step up to version $tag_name" -m "$release_message" -a

rm -f $temp_file
