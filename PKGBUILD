# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=1.0.2
pkgrel=2
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('custom:MIT')
depends=('guile' 'rofi')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        LICENSE)
b2sums=('459e28272b2f7e145f4eefc80b55b1d0e61ced1179f88ece1dca346b3364d79ba2682bb4e18e3b2e446d35af144297f2d5da71085a04dc85b41e4247d0c94117'
        '807b094561801b696f11f57819fc94283a7aa344cb00cbc7aea374c6e669e09ac85a9e07327b100fe544fd8149b3a4dfa4b94dd6ce9746810427a07dc2f5b01d')

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/pinentry-rofi.scm  "${pkgdir}"/usr/bin/pinentry-rofi
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/LICENSE
}
