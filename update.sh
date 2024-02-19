# update.sh
# bump package version (borrowed from AUR : portfolio-performance-bin.git - thx)

VERSION=$(curl -sL https://api.github.com/repos/Tensai75/nzb-monkey-go/releases/latest | jq -r .tag_name | sed 's/^v//')
echo $VERSION

sed -i -e 's/pkgver=.*/pkgver='$VERSION'/' PKGBUILD

updpkgsums

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package ${PKG} has most recent version ${VER}"
	exit 0
fi

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "feat: update to v${VERSION}"
