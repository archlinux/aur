# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=fuchsia-cursor
pkgver=2.0.1
pkgrel=2
pkgdesc="First OpenSource port of FuchsiaOS's cursors for Linux and Windows."
arch=('any')
url='https://github.com/ful1e5/fuchsia-cursor'
license=('GPL-3.0-or-later')
source=("Fuchsia-${pkgver}.tar.gz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia.tar.xz"
        "Fuchsia-Amber-${pkgver}.tar.xz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Amber.tar.xz"
        "Fuchsia-Pop-${pkgver}.tar.xz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Pop.tar.xz"
        "Fuchsia-Red-${pkgver}.tar.xz::https://github.com/ful1e5/${pkgname}/releases/download/v${pkgver}/Fuchsia-Red.tar.xz")
sha256sums=('6e815a4d2234938373c13bdb2ffbb80f57488b5b1a3b4d26af6607beebed406a'
            '3c5471783334e7300dfc7882a11e64de247ef5f82cd200898ead1dba3e38c878'
            '09014aa3daffc43c505f08feec17ccc9a0e88dcd9d0732e2dbd233b70990f63f'
            '2a81ee41f839398b31209ed5cb03e6b8c5fa1cf6d9ecd77af8aab403d98e24d0')

package() {
  install -Ddm755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve=ownership "Fuchsia" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Amber" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Pop" "${pkgdir}/usr/share/icons/"
  cp -dr --no-preserve=ownership "Fuchsia-Red" "${pkgdir}/usr/share/icons/"
}
