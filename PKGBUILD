# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>
pkgname=clean
pkgver=2.0
pkgrel=1
pkgdesc="System cleaner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/architalia/clean"
license=('GPL3')
groups=()
depends=('bash' 'bc')
makedepends=()
checkdepends=()
optdepends=()
source=("https://raw.githubusercontent.com/ArchItalia/clean/main/src/clean")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 clean "$pkgdir/usr/bin/clean"
}

