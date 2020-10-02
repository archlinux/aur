# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.4.2
pkgrel=1
pkgdesc='The MongoDB Shell includes all features of legacy mongo shell with new syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('apache-2.0')
depends=('mongodb-bin')
provides=("mongosh")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux.tgz")
sha256sums=("0b98fd601663f0fab847eec180190d831aee2f5bfc076ce2f0b7d4bcad88ba4f")
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 mongosh $pkgdir/usr/bin/mongosh
}
