# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dynstr
pkgver=0.1.0
pkgrel=4
pkgdesc="Minimal library that provides dynamic strings using plain C99"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/dynstr"
license=('Apache')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6fed0197ed1da1d37acc1622654dabb1242f6b961f601d26d7713b3b5f04b50e176dbc9d233a55dec5ce92ffb382e192d5882fb15624fa6555eb12d000556cfd')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  sudo make install prefix=/usr
}

