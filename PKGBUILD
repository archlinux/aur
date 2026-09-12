# Maintainer: Muhammed Dali <support@ardali.app>

pkgname=ardali
pkgver=7.0.1
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
sha256sums=('badf8687c880001ac7514a801d771e123421c037cc1667c2cc5c6512d523da00')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
}
