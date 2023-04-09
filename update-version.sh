set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

version=$(curl -sL \
	-H "Accept: application/vnd.github+json" \
	https://api.github.com/repos/quarto-dev/quarto-cli/releases |\
	jq "map(select(.prerelease))[0].name" -r |\
	tr -d "v")
echo $version
sha256sum=$(curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v$version/quarto-$version-checksums.txt | grep "amd.*deb" | cut -f1 -d" ")
echo $sha256sum

sed "s/:version:/$version/;s/:shasum:/$sha256sum/" PKGBUILD.template > PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git add -A
git commit -am "Autorelease version $version"
git push
