set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

version=$(curl -sL \
	-H "Accept: application/vnd.github+json" \
	https://api.github.com/repos/quarto-dev/quarto-cli/releases |\
	jq "map(select(.prerelease))[0].name" -r |\
	tr -d "v")
echo $version
sha256sumamd64=$(curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v$version/quarto-$version-checksums.txt | grep "amd.*deb" | cut -f1 -d" ")
sha256sumarm64=$(curl -sL https://github.com/quarto-dev/quarto-cli/releases/download/v$version/quarto-$version-checksums.txt | grep "arm.*deb" | cut -f1 -d" ")

sed "s/:version:/$version/;s/:shasum_amd64:/$sha256sumamd64/;s/:shasum_arm64:/$sha256sumarm64/" PKGBUILD.template > PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git add -A
git commit -am "Autorelease version $version"
git push
