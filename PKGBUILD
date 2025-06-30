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
sha256sums=('d32e6809b99a8f1c135adf5bb82f1bef173c0d14fefaf597be7bcae6dcc5d59a')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}