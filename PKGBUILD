pkgname=sdupes
pkgver=1.0
pkgrel=1
pkgdesc="fast file duplicate detection"
arch=(x86_64)
license=(gpl3+)
makedepends=(git)
provides=(sdupes)
source=("https://github.com/sph-mn/sdupes/archive/v1.0.tar.gz")
url="https://github.com/sph-mn/sdupes"
md5sums=(70e1f6f35f93611a8f54bebaadb19782)

package() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile-c
  install -Dt "${pkgdir}/usr/bin" temp/sdupes
}