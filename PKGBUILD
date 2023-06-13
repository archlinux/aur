pkgname=sdupes
pkgver=1.1
pkgrel=1
pkgdesc="fast duplicate file detection"
arch=(x86_64)
license=(gpl3+)
makedepends=()
provides=(sdupes)
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v1.1.tar.gz")
url="https://github.com/sph-mn/sdupes"
md5sums=(dd3129af5e7c411bcf9f304e8bcf19bf)

package() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile-c
  install --mode 755 -Dt "${pkgdir}/usr/bin" temp/sdupes
}
