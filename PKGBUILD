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
sha256sums=('ad3819bf49cfc46dd5b0602f80c393890f278c804d9026af207261917d3e00ef')

package() {
  cd "$srcdir/"

  install -Dm755 gooseberry "${pkgdir}/usr/bin/gooseberry"
}
