# Maintainer: N.Boughton, <nicholasboughton@gmail.com>
pkgname=swnt
pkgver=0.8.1
pkgrel=1
pkgdesc="Command line GM tools for Stars Without Number"
arch=('x86_64')
url="https://github.com/nboughton/swnt"
license=("MIT")
optdepends=('hugo: export sectors as hugo sites')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/swnt/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha1sums=('d4c7564783bce5725f42f40f8ca8191e6a113610')

#build() {
#  cd "$srcdir/$pkgname-$pkgver"
#  go build -v -o swnt
#}

package() {
  cd "$srcdir/build/"
  install -Dm755 "${pkgname}.linux" "${pkgdir}/usr/bin/${pkgname}"
}
