# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('has')
pkgver=1.6.0
pkgrel=1
pkgdesc='has checks presence of various command line tools and their versions on the path'
arch=('any')
url='https://github.com/kdabir/has'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('99b4b82d8b935521bd1b44bf7a6af3421f4c850a28b8edfee39e6ee75af4d78f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
