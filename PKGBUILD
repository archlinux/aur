# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=vertrux-icon-theme
pkgver=0.1
pkgrel=1
pkgdesc="Squared icon set for Linux - Light and Dark"
url="https://github.com/satriani-vai/vertrux-icon-theme"
arch=('any')
license=('unknow')
source=("https://github.com/satriani-vai/vertrux-icon-theme/archive/0.1.tar.gz")
depends=('librsvg')
options=(!strip)
sha256sums=('b915e1dfa9d08ef67de546170d44b007d2168e3fc221f8e8d8035ab6ce2fb0b7')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/vertrux-icon-theme-dark" "${pkgdir}/usr/share/icons/${pkgname}-dark"
  cp -r "${srcdir}/${pkgname}-${pkgver}/vertrux-icon-theme-light" "${pkgdir}/usr/share/icons/${pkgname}-light"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
