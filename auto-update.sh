#! /usr/bin/env bash
#
die() {
  echo "$@" >&2
  exit 1
}

## https://api.github.com/repos/tinkernels/doh-relay/tags | jq -r .[].name | head -1
URL="https://api.github.com/repos/patrickelectric/qhot/tags"
REPO="https://github.com/patrickelectric/qhot.git"

if [ -z "$GITHUB_TOKEN" ]; then
  die "Missing GITHUB_TOKEN to access API."
fi

temp_file=$(mktemp)
tempdir=$(mktemp -d)
trap "rm -f $tempfile $tempdir" 1 2 3 6 13 15
 # From example: https://docs.github.com/en/rest/releases/releases?apiVersion=2022-11-28#get-the-latest-release
curl -sL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  $URL > $temp_file || \
  die "Failed to fetch data from latest release"

tag_name=$(jq -r ".[].name" < $temp_file | head -1)
echo "tag_name: $tag_name"

current_tag=$(grep "^gittag" PKGBUILD | cut -d= -f2)
echo "current_tag: $current_tag"

if [ "$current_tag" = "$tag_name" ];then
  echo "Same versions.  Nothing to be done."
  rm -f $temp_file
  exit 0
fi

curdir=$(pwd)
cd $tempdir
git clone -q $REPO qhot
cd qhot
git checkout -b $tag_name tags/$tag_name

git_hash=$(git rev-parse --short HEAD)
echo "git_hash: $git_hash"
git_count=$(git rev-list --count HEAD)
echo "git_count: $git_count"
git_date=$(git log -1 --date=format:"%Y%m%d" --format="%ad")
echo "git_date: $git_date"
git_message=$(git log -1 --pretty=%B)
echo "git_message: $git_message"
cd $curdir

echo "Updating AUR package to: $tag_name"

echo "Updating version into PKGBUILD"
# pkgver=qt6-1.1.0.r87.20230908.6c50b53
sed -i "s/pkgver=.*/pkgver=qt6+$tag_name.r$git_count.$git_date.$git_hash/" PKGBUILD || \
  die "Failed to update version into PKGBUILD"
sed -i "s/gittag=.*/gittag=$tag_name/" PKGBUILD || \
  die "Failed to update version into PKGBUILD"

echo "Updating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO || \
  die "Failed to update .SRCINFO"

echo "Generating package"
makepkg || \
  die "Failed to generate package"

echo "Creating git commit message"
git commit -m "Step up to version $tag_name" -m "$release_message" -a
