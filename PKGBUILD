# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=llama.cpp-server-tray
pkgver=0.4.1
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python' 'leafpad' 'qt-sudo')
options=(!strip !debug)
source=($pkgname-$pkgver::https://github.com/envolution/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('1abd3a9840df44f298ee44a2db0d37727c889de1344aea9873be0da901c44742')

package() {
  cd $pkgname-$pkgver && make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
