# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=gimp-ultimate-web-gradients
pkgver=1
pkgrel=2
pkgdesc="The complete 130 Ultimate Web 2.0 Gradients for Gimp!"
arch=(any)
url="http://gimp-tutorials.net/"
license=(GPL)
depends=(gimp)
makedepends=(unzip)
source=("http://gimp-tutorials.net/files/130-UltimateWeb2-0-Gradients-for-Gimp.zip")
sha256sums=('2928446f44a134d06224b09c601ca0bf35629d6442ba2aca6b1f7b8e16bd893a')
package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/gimp/2.0/gradients || return 1
  install -Dm644 gradients/* ${pkgdir}/usr/share/gimp/2.0/gradients/ || return 1
  install -dm755 ${pkgdir}/usr/share/${pkgname} || return 1
  install -Dm644 {130-UltimateWeb2.0Gradients.xcf,130-UltimateWeb20-Gradients-for-Gimp.png,README.txt} \
    ${pkgdir}/usr/share/${pkgname}/ || return 1

}
