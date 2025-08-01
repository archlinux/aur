# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('has')
pkgver=1.5.2
pkgrel=1
pkgdesc='has checks presence of various command line tools and their versions on the path'
arch=('any')
url='https://github.com/kdabir/has'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('965629d00b9c41fab2a9c37b551e3d860df986d86cdebd9b845178db8f1c998e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
