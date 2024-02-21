set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

version=$(curl -sL \
	-H "Accept: application/vnd.github+json" \
	https://api.github.com/repos/JuliaLang/juliaup/releases |\
	jq "map(select(.prerelease != true))[0].name" -r |\
	tr -d "v")
echo $version

sed "s/:version:/$version/" PKGBUILD.template > PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -A
git commit -am "Autorelease version $version"
git push
