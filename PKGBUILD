# Maintainer: Muhammed Dali <support@ardali.app>

pkgname=ardali-bin
pkgver=7.1.0
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
sha256sums=('20be856b358bc9e50f3fedd51f6f2de5a05a4d55b220ffd17d914ba220f74279')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
}
