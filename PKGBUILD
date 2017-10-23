# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
pkgname=spotify-web-shortcut
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop shortcut for Spotify Web application"
arch=('any')
license=('MIT')
depends=('chromium')
source=('spotify-web.desktop'
        'spotify-web.png')
md5sums=('1c563c1061785c99b4a7a1b04457c35d'
         '73b5b5660e6dd4e8a465186248f9b70d')
options=(!strip)

package() {
  cd "$srcdir"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/spotify-web.desktop" "${pkgdir}/usr/share/applications/spotify-web.desktop"
  install -m644 "${srcdir}/spotify-web.png" "${pkgdir}/usr/share/pixmaps/spotify-web.png"
}
