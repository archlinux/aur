# Maintainer: kompowiec <diasp2o2.pl>
pkgname=git-gpm-bin
pkgver=0.19.3
pkgrel=1
pkgdesc="statically linked, native, platform agnostic Git-based Package Manager written in Rust."
arch=('x86_64')
url="https://github.com/aerys/gpm"
license=('MIT')
depends=()
source=("https://github.com/aerys/gpm-packages/raw/master/gpm-linux64/gpm-linux64.tar.gz")
sha256sums=('SKIP')  # Replace with the actual checksum for better security

package() {
    cd "$srcdir"
    install -Dm755 gpm "$pkgdir/usr/bin/gpm"
}

# vim:set ts=2 sw=2 et:

