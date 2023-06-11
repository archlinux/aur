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
md5sums=(520853c70e82b0e50ffff00fb951fc73)

package() {
  cd "${srcdir}/sdupes-$pkgver"
  ./exe/compile-c
  install --mode 755 -Dt "${pkgdir}/usr/bin" temp/sdupes
}
