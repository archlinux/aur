# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=0.4.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('MIT')
depends=('guile')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}.tar.gz")
sha512sums=('8fddaff54777f4d5aa87c5bff7b1d1304f3534abddfd61dd4d382f2e422ebee1ca39b99a8b331fd06e9a1bce15f3940729b9d1ae5acb7c3280b5563a5288d2d9')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pinentry-rofi.scm"  "${pkgdir}/usr/bin/pinentry-rofi"
}
