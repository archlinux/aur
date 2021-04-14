# Maintainer: Michael Berlinger <michaelmberlinger@gmail.com>

pkgname=gooseberry-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Knowledge Base for the Lazy"
url='https://github.com/out-of-cheese-error/gooseberry'
arch=('i686' 'x86_64')
license=('Apache')
depends=()
optdepends=('bat: display highlighted markdown in the terminal')
provides=('gooseberry')
source=("https://github.com/out-of-cheese-error/gooseberry/releases/download/$pkgver/gooseberry-linux.tar.gz")
sha256sums=('edd45a3dc000fbf25faf2693748c1567950177e0edff61ea0218ad011b78066d')

package() {
  cd "$srcdir/"

  install -Dm755 gooseberry "${pkgdir}/usr/bin/gooseberry"
}
