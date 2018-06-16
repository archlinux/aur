# $Id$
# Maintainer: lxz <lxz@ilxz.me>

pkgname=deepin-default-settings
pkgver=2018.5.31
pkgrel=1
pkgdesc="Deepin default settings"
arch=('x86_64')
url="https://github.com/linuxdeepin/default-settings"
license=('GPL3')
depends=('dkms')
groups=('deepin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/default-settings/archive/$pkgver.tar.gz")
sha512sums=('6a210f2b3797647b0bf280ecd97b2d71ff6c882d9cd8d8daadf141b2125c5ade3af4f27086be3c6e68e3f823c0acb4753afbbadcee2cf82b0d18559409b7d64d')

build() {
  cd deepin-default-settings-$pkgver
}

package() {
  cd deepin-default-settings-$pkgver
  make install
}