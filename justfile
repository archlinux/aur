[private]
default:
    @just -u -l

# Update to a new version and verify.
[group('main')]
update version: (update-pkgbuild version) build srcinfo

# Remove build artifacts.
[group('main')]
clean:
    rm -rf janet-lang-*.tar.gz janet-lang-*.zst jpm pkg src

# Build and test the package.
[group('util')]
build:
    makepkg --cleanbuild --clean --force --check

# Update PKGBUILD to the given Janet release.
[group('util')]
update-pkgbuild version:
    #!/usr/bin/env sh
    set -e
    sha=$(curl -sL https://github.com/janet-lang/janet/archive/v{{version}}.tar.gz | sha256sum | cut -d ' ' -f 1)
    sed -e "s/^pkgver=.*/pkgver={{version}}/" -e "s/^pkgrel=.*/pkgrel=1/" -e "s/^sha256sums=.*/sha256sums=('${sha}'/" PKGBUILD > PKGBUILD.new
    mv PKGBUILD.new PKGBUILD

# Update .SRCINFO.
[group('util')]
srcinfo:
    makepkg --printsrcinfo > .SRCINFO
