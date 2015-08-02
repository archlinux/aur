# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=gopherfs
pkgver=0.7
pkgrel=1
pkgdesc="a gopher file system for FUSE."
arch=('i686' 'x86_64')
url="http://r-36.net/src/Various/"
license=('unknow')
depends=()
source=(http://r-36.net/src/Various/gopherfs-0.7.tgz)
md5sums=('38489764859bc25211cb7d23a08a699f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make
}
package() {
  cd $startdir/src/$pkgname-$pkgver
  install -Dm755 gopherfs $pkgdir/usr/bin/gopherfs
}
