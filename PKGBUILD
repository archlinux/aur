# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=repose
pkgver=5
pkgrel=1
pkgdesc="archlinux repo building tool"
arch=('i686' 'x86_64')
url="http://github.com/vodik/repose"
license=('GPL')
depends=('pacman' 'libarchive' 'gnupg')
makedepends=('git')
source=("$url/archive/$pkgver.tar.gz")

build() {
  make -C repose
}

package() {
  make -C repose DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
md5sums=('9998f2faba23c4f77dbe47e308b57689')
