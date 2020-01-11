# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Adam Gaskins <self@adamgaskins.com>
# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=gopherfs
pkgver=0.7
pkgrel=2
pkgdesc="gopher file system for FUSE"
arch=('i686' 'x86_64')
url="https://github.com/ewe2/gopherfs"
license=(GPL3)
depends=('fuse2')
source=(http://9front.org/extra/gopherfs-0.7.tgz)
md5sums=('38489764859bc25211cb7d23a08a699f')

build() {
  cd $pkgname-$pkgver
  make
}
package() {
  cd $pkgname-$pkgver
  install -Dm755 gopherfs $pkgdir/usr/bin/gopherfs
}
