# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.7.7
pkgrel=1
pkgdesc='The MongoDB Shell includes all features of legacy mongo shell with new syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('apache-2.0')
optdepends=('mongodb-bin')
provides=("mongosh")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux.tgz")
sha256sums=("7b246dc1590a7e63680a135f895c1356896fea6e9a2aa37b89ffa11497882367")
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 ./bin/mongosh $pkgdir/usr/bin/mongosh
  install -Dm644 ./LICENSE-mongosh $pkgdir/usr/share/doc/$pkgname/LICENSE
  install -Dm644 ./THIRD_PARTY_NOTICES $pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_NOTICES
}
