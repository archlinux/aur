# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('has')
pkgver=1.5.1
pkgrel=1
pkgdesc='has checks presence of various command line tools and their versions on the path'
arch=('any')
url='https://github.com/kdabir/has'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('9693e50673fffcfdfe0eea2b9c3c4455c5c46c4eee390bd3cffb3e51bbfc291b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
