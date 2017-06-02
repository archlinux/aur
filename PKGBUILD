# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gpaste-menu
pkgver=0.1.0
pkgrel=1
pkgdesc="Dmenu interface for gpaste-client"
arch=('any')
license=('MIT')
url="https://github.com/subosito/gpaste-menu"
depends=('gpaste')

source=("${url}/archive/master.zip")
sha256sums=('fc4916f41670294e152ec8cfa20678d85071b1d95c3d05db6dd619d67bdd55a4')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gpaste-menu"

  install -m755 "${srcdir}/gpaste-menu-master/gpaste-menu" "${pkgdir}/usr/bin/gpaste-menu"
  install -m644 "${srcdir}/gpaste-menu-master/LICENSE" "${pkgdir}/usr/share/gpaste-menu/LICENSE"
}
