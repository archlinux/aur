# Maintainer: Muhammed Dali <support@dalinira.app>

pkgname=dalinira
pkgver=7.2.0
pkgrel=1
pkgdesc="DaliNira Browser native binary package"
arch=('x86_64')
url="https://github.com/Muhammed-Dali/DaliNira-Browser"
license=('GPL-3.0-only')
depends=(
  'ffmpeg'
  'openssl'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-webengine'
)
provides=('dalinira-browser' 'dalinira-bin' 'dalinira-webmedia')
conflicts=('dalinira-browser' 'dalinira-bin' 'dalinira-webmedia')
replaces=('dalinira-bin' 'dalinira-webmedia')
source=("dalinira-browser-${pkgver}-linux-x86_64.tar.zst::https://github.com/Muhammed-Dali/DaliNira-Browser/releases/download/v${pkgver}/dalinira-browser-${pkgver}-linux-x86_64.tar.zst")
sha256sums=('e9f6b58550757b8d82540e49fc77637d7c0767832390579e36659fae1dba3a78')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
}
