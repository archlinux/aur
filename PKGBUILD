# Maintainer: envolution

pkgname=llama.cpp-server-tray
pkgver=0.4
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python' 'leafpad' 'qt-sudo')
options=(!strip !debug)
source=($pkgname-$pkgver::https://github.com/envolution/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('c7da6a9b9971964d84bdb62237cfb738232fe869777286d58f492c930763a5ff')

package() {
  cd $pkgname-$pkgver && make install DESTDIR=$pkgdir
}
# vim:set ts=2 sw=2 et:
