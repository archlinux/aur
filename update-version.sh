set -xeu
version=$(curl -sL \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/quarto-dev/quarto-cli/releases  | jq "map(select(.prerelease))[0].name" | tr -d "v")
echo $version
sed "s/:version:/$version/" PKGBUILD.template > PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -A
git commit -am "Autorelease version $version"
git push
