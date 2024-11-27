# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=llama.cpp-server-tray
pkgver=0.4.2
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python' 'leafpad' 'qt-sudo')
options=(!strip !debug)
source=($pkgname-$pkgver::https://github.com/envolution/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('faedc40649f673f8dfd7208dcfb16ba2ed149618948d9a617aca13c0fa928df4')

package() {
  cd $pkgname-$pkgver && make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
