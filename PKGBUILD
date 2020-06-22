# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=klogg-bin
pkgver=20.4
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/variar/klogg/releases/download/v${pkgver}/klogg-${pkgver}.0-r589-Linux.deb")
sha256sums=('fa4149f752b9518449520f4b2107aa6d11de0c7d5a1c268d2c8b86545edd0963')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}