# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>
pkgname=clean
pkgver=2.0
pkgrel=1
pkgdesc="System cleaner from command $ clean"
arch=('any')
url="https://github.com/architalia/clean"
license=('GPL3')
groups=()
depends=('bash' 'bc')
makedepends=()
checkdepends=()
optdepends=()
source=("https://raw.githubusercontent.com/ArchItalia/clean/main/src/clean")
sha256sums=('SKIP')



package() {
    install -Dm755 clean "$pkgdir/usr/bin/clean"
}

