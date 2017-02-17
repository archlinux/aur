# Maintainer: Carlos Toro <ertsheiker at gmail dot com>

pkgname=minergate
pkgver=6.6
pkgrel=2
pkgdesc='Cryptocurrency GUI miner and Mining Pool'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate')
license=('custom')
source=('https://en.minergate.com/download/ubuntu')
md5sums=('ec7cbe2af12bd7f8fa65a089dcd3d5be')
depends=('qt5-base'
         'ocl-icd'
         'gcc-libs-multilib'
         'qt5-websockets')
optdepends=('bfgminer')
install=$pkgname.install

package() {
  bsdtar xf data.tar.gz
  chmod -R g-w usr opt
  mv usr opt "${pkgdir}"
}
