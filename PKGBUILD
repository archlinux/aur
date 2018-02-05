# $Id$
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=dht
pkgver=0.24
pkgrel=1
pkgdesc="BitTorrent DHT library"
arch=('i686' 'x86_64')
url="https://github.com/jech/dht"
license=('MIT')
source=(https://raw.githubusercontent.com/jech/dht/master/dht.h)
sha256sums=('4c03ab71da7f7b76331a5b625fe4cd1bc9b1f58039b48bf2ceb6b47f1353bd48')

package() {
  install -D dht.h "${pkgdir}"/usr/include/dht/dht.h
}
