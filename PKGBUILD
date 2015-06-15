# Contributor: Bug <bug2000@gmail.com>
pkgname=xpmidi
pkgver=3.5
pkgrel=1
pkgdesc="pmidi X frontend"
arch=('i686' 'x86_64')
url="http://www.mellowood.ca/xpmidi/"
license=('GPL')
depends=('python' 'tk')
source=("http://www.mellowood.ca/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3b48c8e63c5173f672992d7269565afe')
DLAGENTS=('http::/usr/bin/wget')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' xpmidi.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D xpmidi.py $pkgdir/usr/bin/xpmidi
}

# vim:set ts=2 sw=2 et:
