# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
pkgname=glowing-bear-shortcut
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop shortcut for Glowing Bear in chromium (app mode)"
arch=('any')
license=('MIT')
depends=('chromium')
source=('glowing-bear.desktop'
        'https://raw.githubusercontent.com/glowing-bear/glowing-bear/9b64d328280cccfbb3299102923f086a9ac32062/assets/img/glowing-bear.png')
md5sums=('a9a283b8ca63aa19ee2c2b737a3742d1'
         '6b9962e721bd7dfb14cf39b80af52bd1')
options=(!strip)

package() {
  cd "$srcdir"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
  install -m644 "${srcdir}/glowing-bear.png" "${pkgdir}/usr/share/pixmaps/glowing-bear.png"
}
