# Maintainer: Gregoire Lodi <gregoire.lodi@gmail.com>

pkgname=decodify
pkgver=0.1.0
pkgrel=1
pkgdesc="It can detect and decode encoded strings, recursively."
arch=("i686" "x86_64")
url="https://github.com/UltimateHackers/Decodify"
license=("GPL")
makedepends=("python2")
source=("$pkgname"::"git+${url}.git")
noextract=()
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "dcode" "${pkgdir}/usr/bin/decodify"
}
