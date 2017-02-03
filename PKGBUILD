# Maintainer: Carlos Toro <ertsheiker at gmail dot com>

pkgname=minergate-cli
pkgver=4.05
pkgrel=1
pkgdesc='Cryptocurrency miner and Mining Pool (console version)'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate-cli')
license=('custom')
source=('https://minergate.com/download/deb-cli')
md5sums=('9e7cc91ef8cf6289c9c1d3e2efce8b3d')
depends=('qt5-base'
         'qt5-websockets')

package() {
  bsdtar xf data.tar.gz
  rm -f opt/minergate-cli/lib/libQt5*
  chmod -R g-w usr opt
  mv usr opt "${pkgdir}"
}
