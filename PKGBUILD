# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=0.5.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('MIT')
depends=('guile')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}.tar.gz")
b2sums=('564761689884834f5d20afee5a00be586e3852996179b92cf9567827ba51a1af2049fbe76cfbae5ce4e4e355395d40a1201bb8d053e61334265255b8432a20de')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pinentry-rofi.scm"  "${pkgdir}/usr/bin/pinentry-rofi"
}
