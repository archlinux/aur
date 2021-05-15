# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('durden')
pkgver=0.6.1
pkgrel=1
pkgdesc='Desktop Environment for Arcan'
arch=('any')
url='https://durden.arcan-fe.com/'
license=('BSD')
depends=('arcan')
source=("$pkgname-$pkgver.tar.gz::https://github.com/letoram/durden/archive/$pkgver.tar.gz")
sha256sums=('d6f7065308befd41dc6c06a149770e194d82d23d0181bc8450723504962d3bd5')

build() {
  :
}

package() {
  cd "$pkgbase-$pkgver"

  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/durden/"
  install -D distr/durden "${pkgdir}/usr/bin/durden"
  cp -a durden "${pkgdir}/usr/share/durden/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
