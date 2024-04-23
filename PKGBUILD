pkgname=llvm-mingw-w64-environment
pkgver=1
pkgrel=5
arch=('any')
pkgdesc="Script providing common environment variables and functions for MinGW (mingw-w64) (fixed for armv7 and aarch64)"
license=("BSD")
url="http://fedoraproject.org/wiki/MinGW"
conflicts=("mingw-w64-environment")
provides=("mingw-w64-environment")
source=("mingw-env.sh")
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}"/usr/bin
  install -m 755 mingw-env.sh "${pkgdir}"/usr/bin/mingw-env
}
