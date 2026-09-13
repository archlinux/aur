# Maintainer: Muhammed Dali <support@ardali.app>

pkgname=ardali-bin
pkgver=7.1.2
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
provides=('ardali-browser' 'ardali' 'ardali-webmedia')
conflicts=('ardali-browser' 'ardali' 'ardali-webmedia' 'aurivo-bin')
replaces=('ardali-webmedia')
source=("ardali-browser-${pkgver}-linux-x86_64.tar.zst::https://github.com/Muhammed-Dali/ArDali-Browser/releases/download/v${pkgver}/ardali-browser-${pkgver}-linux-x86_64.tar.zst")
sha256sums=('8e279b73bd8b5891b557b80dc84d85b01cd46ccbceec9cf9da9dfa4de8e63bc2')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
}
