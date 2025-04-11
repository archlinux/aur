# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi (Canmi21)

pkgname="lan-share-bin"
pkgver="1.2.1"
pkgrel=1
pkgdesc="Cross platform LAN File transfer application built with Qt C++ framework"
arch=("x86_64")
url="https://github.com/abdularis/LAN-Share/releases"
license=("GPL-3.0")
depends=("qt5-base" "gcc-libs")
options=('!strip')
source=("https://github.com/abdularis/LAN-Share/releases/download/${pkgver}/lanshare_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('SKIP')

package() {
  ar x "${srcdir}/lanshare_${pkgver}-${pkgrel}_amd64.deb"
  tar -xf data.tar.xz -C "${pkgdir}"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}