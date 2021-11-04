# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('has')
pkgver=1.4.0
pkgrel=1
pkgdesc='has checks presence of various command line tools and their versions on the path'
arch=('any')
url='https://github.com/kdabir/has'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('0e73552dbf59e3da0d9254da87c94599595c9ea07c69a62a4853e69bbf3f0d7d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
