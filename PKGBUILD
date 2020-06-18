# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.0.6
pkgrel=1
pkgdesc='The MongoDB Shell is a fully functional JavaScript environment for interacting with MongoDB deployments having syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('apache-2.0')
depends=('mongodb-bin')
provides=("mongosh=$pkgver")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux.tgz")
sha256sums=('55c2ff2ff44f8de14fa28eb8923a76f6571ca3549005c8aaa4c5e695005080f5')
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 mongosh $pkgdir/usr/bin/mongosh
}
