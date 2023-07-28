# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('has')
pkgver=1.5.0
pkgrel=1
pkgdesc='has checks presence of various command line tools and their versions on the path'
arch=('any')
url='https://github.com/kdabir/has'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('d45be15f234556cdbaffa46edae417b214858a4bd427a44a2a94aaa893da7d99')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
