# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=klogg-bin
pkgver=20.12
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/variar/klogg/releases/download/v20.12/klogg-20.12.0.812-Linux.deb")
sha256sums=('393d336fef476f200351f127625b990da3a6ae5b247a482ec8e3e0425f0c9b0b')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
