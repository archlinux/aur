pkgname=sdupes
pkgver=1.3
pkgrel=1
pkgdesc="fast duplicate file detection"
arch=(x86_64)
license=(gpl3+)
makedepends=(gcc)
provides=(sdupes)
source=("https://github.com/sph-mn/sdupes/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/sph-mn/sdupes"
md5sums=(d38708387cf62035cf854293f3e76ccb)

package() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile
  chmod 755 exe/sdupes
  mkdir -p "${pkgdir}/usr/bin"
  cp exe/sdupes "${pkgdir}/usr/bin"
}
