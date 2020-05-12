# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=1.0.2
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('MIT')
depends=('guile')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}.tar.gz")
b2sums=('459e28272b2f7e145f4eefc80b55b1d0e61ced1179f88ece1dca346b3364d79ba2682bb4e18e3b2e446d35af144297f2d5da71085a04dc85b41e4247d0c94117')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pinentry-rofi.scm"  "${pkgdir}/usr/bin/pinentry-rofi"
}
