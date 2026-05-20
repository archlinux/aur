default:
    @just --list

# Build the package
build:
    makepkg -sf

# Build and install the package
install:
    makepkg -si

# Remove build artifacts
clean:
    rm -rf src/ pkg/ *.pkg.tar.zst postgres-language-server LICENSE

# Update to a new upstream version
update version:
    sed -i "s/^pkgver=.*/pkgver={{ version }}/" PKGBUILD
    sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
    updpkgsums
    makepkg --printsrcinfo > .SRCINFO
