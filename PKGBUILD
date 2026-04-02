pkgname=ninja-makeflags
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Ninja wrapper honoring MAKEFLAGS"
depends=('ninja')
license=("BSD-3-CLause")
url="https://ninja-build.org/"
source=("ninja-makeflags.sh")
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}"/usr/bin
  install -m 755 ninja-makeflags.sh "${pkgdir}"/usr/bin/ninja-makeflags
}

