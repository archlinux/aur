pkgname=sdupes
pkgver=1.0
pkgrel=2
pkgdesc="fast duplicate file detection"
arch=(x86_64)
license=(gpl3+)
makedepends=()
provides=(sdupes)
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v1.0.tar.gz")
url="https://github.com/sph-mn/sdupes"
md5sums=(b4c31ab8764410c39e9c0e0ff641951d)

package() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile-c
  install --mode 755 -Dt "${pkgdir}/usr/bin" temp/sdupes
}
