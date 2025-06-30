# Maintainer:
# Contributor:
pkgname=xj-gomoku
pkgver=1.0.0
pkgrel=1
pkgdesc="gomoku"
arch=('any')
url="https://gitee.com/xiaojinpro/xj-gomoku.git#branch=online"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://www.lideying.cn/resource/xj-gomoku/"$pkgname"_"$pkgver"_amd64.deb")
sha256sums=('7f0f14843f0bd517fe1cc438a28c69611b2c4848ac5a33511b6df9b828dfa668')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}