[private]
default:
    @just -u -l

# Update to a new version and verify.
update version: (update-pkgbuild version) build srcinfo

# Update PKGBUILD to the given Janet release.
update-pkgbuild version:
    #!/usr/bin/env sh
    set -e
    sha=$(curl -sL https://github.com/janet-lang/janet/archive/v{{version}}.tar.gz | sha256sum | cut -d ' ' -f 1)
    sed -e "s/^pkgver=.*/pkgver={{version}}/" -e "s/^sha256sums=.*/sha256sums=('${sha}'/" PKGBUILD > PKGBUILD.new
    mv PKGBUILD.new PKGBUILD

# Build and test the package.
build:
    makepkg --cleanbuild --clean --force --check

# Update .SRCINFO.
srcinfo:
    makepkg --printsrcinfo > .SRCINFO

# Remove build artifacts.
clean:
    rm -rf janet-lang-*.tar.gz janet-lang-*.zst jpm pkg src
