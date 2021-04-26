# Maintainer: Michael Berlinger <michaelmberlinger@gmail.com>

pkgname=gooseberry-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Knowledge Base for the Lazy"
url='https://github.com/out-of-cheese-error/gooseberry'
arch=('i686' 'x86_64')
license=('Apache')
depends=()
optdepends=('bat: display highlighted markdown in the terminal')
provides=('gooseberry')
source=("https://github.com/out-of-cheese-error/gooseberry/releases/download/$pkgver/gooseberry-linux.tar.gz")
sha256sums=('a3d409ea4de1f69d65172d1d0d01edcd3afac373aec52e7675856f5bf961cfa8')

package() {
  cd "$srcdir/"

  install -Dm755 gooseberry "${pkgdir}/usr/bin/gooseberry"
}
