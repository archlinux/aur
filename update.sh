VERSION=$(curl -sL https://api.github.com/repos/buchen/portfolio/releases/latest | jq -r .tag_name)
CURRENT_VERSION=$(grep 'pkgver=' PKGBUILD | cut -d'=' -f2)

# If GitHub's version is different from the current version, update the PKGBUILD file
if [[ $VERSION != $CURRENT_VERSION ]]; then
    echo "Updating PKGBUILD to version $VERSION..."
    sed -i -e 's/pkgver=.*/pkgver='$VERSION'/' PKGBUILD
    sed -i -e 's/pkgrel=.*/pkgrel=1/' PKGBUILD

    updpkgsums
    makepkg --printsrcinfo > .SRCINFO

    git add PKGBUILD .SRCINFO
    git commit -m "feat: update to v${VERSION}"
    echo "Update complete!"
else
    echo "Current version ($CURRENT_VERSION) is up-to-date."
    exit 0
fi
