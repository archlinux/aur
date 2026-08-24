# Maintainer: Muhammed Dali <support@ardali.app>

pkgname=ardali
pkgver=6.1.2
pkgrel=1
pkgdesc="ArDali Browser native binary package"
arch=('x86_64')
url="https://github.com/Muhammed-Dali/ArDali-Browser"
license=('GPL-3.0-only')
depends=(
  'ffmpeg'
  'openssl'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-webengine'
)
provides=('ardali-browser' 'ardali-bin' 'ardali-webmedia')
conflicts=('ardali-browser' 'ardali-bin' 'ardali-webmedia' 'aurivo-bin')
replaces=('ardali-bin' 'ardali-webmedia')
source=("ardali-browser-${pkgver}-linux-x86_64.tar.zst::https://github.com/Muhammed-Dali/ArDali-Browser/releases/download/v${pkgver}/ardali-browser-${pkgver}-linux-x86_64.tar.zst")
sha256sums=('875abcb74cf0a08ba54c08240c26bdc70f11607880bbca7d13a63b31773bbd38')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
}
