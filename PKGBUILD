# Maintainer: nafets227 <nafets227@users.noreply.github.com>
# Contributor: luelistan <archlinux-aur-git@max-weller.de>

pkgname=dhtest
pkgver=988afec50c596245947d8a478cf8f7112f5ca662
pkgrel=1
pkgdesc="A DHCP client simulation on linux"
arch=("x86_64")
depends=("glibc")
url="https://github.com/saravana815/dhtest"
license=('GPL2')

source=("https://github.com/saravana815/dhtest/archive/${pkgver}.tar.gz")
sha256sums=("a9ac727d30ce86df62720f2b493779f44633c5ab67390f24caa043a86c4f4bae")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install dhtest $pkgdir/usr/bin/dhtest
}

