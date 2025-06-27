# Maintainer:
# Contributor:
pkgname=xj_gomoku
pkgver=1.0.0
pkgrel=1
pkgdesc="gomoku"
arch=('any')
url="https://gitee.com/xiaojinpro/xj_gomoku.git#branch=online"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://www.lideying.cn/resource/xj_gomoku/"$pkgname"_"$pkgver"_arm64.deb")
sha256sums=('1ceb4f6c97ebe96c92f18fd98dcd74a4e244d00312d7427435fa20ec0acaae17')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}