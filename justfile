# Justfile for release management
set shell := ["bash", "-uc"]

# Prompt for the tag version and create a release
release:
    #!/bin/bash
    echo "Enter the new release version (e.g., X.YY.ZZ):"
    version=$(gum input --placeholder "X.YY.ZZ")
    # download the archive from github
    curl -L -o "v$version.tar.gz" "https://github.com/bitSheriff/dunst-timer/archive/v$version.tar.gz"
    # calculate the sha256sum
    sha256sum=$(sha256sum "v$version.tar.gz" | cut -d ' ' -f 1)
    
    # Update the version in PKGBUILD
    echo "Updating PKGBUILD version..."
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
    sed -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD

    # Update the sha256sum in PKGBUILD
    echo "Updating PKGBUILD sha256sum..."
    sed -i "s/sha256sums=.*/sha256sums=('$sha256sum')/" PKGBUILD

    # Update the version in .SRCINFO
    makepkg --printsrcinfo > .SRCINFO

    # Commit the changes
        gum confirm --default=false "Commit and Push?" && (
        git add PKGBUILD .SRCINFO
        git commit -m "Release $version"
        git push
    )



# Build and install the package
install:
    makepkg -si
