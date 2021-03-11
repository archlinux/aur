# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.9.0
pkgrel=1
pkgdesc='The MongoDB Shell includes all features of legacy mongo shell with new syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('apache-2.0')
optdepends=('mongodb-bin')
provides=("mongosh")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux.tgz")
sha256sums=("79db7889335a753da094159764ceb405b7708745ddc7f7a74f24b04438101ddc")
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 ./bin/mongosh $pkgdir/usr/bin/mongosh
  install -Dm755 ./bin/mongocryptd-mongosh $pkgdir/usr/bin/mongocryptd-mongosh
  install -Dm644 ./LICENSE-mongosh $pkgdir/usr/share/doc/$pkgname/LICENSE
  install -Dm644 ./THIRD_PARTY_NOTICES $pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_NOTICES
  install -Dm644 ./LICENSE-mongocryptd $pkgdir/usr/share/doc/$pkgname/LICENSE-mongocryptd
  install -Dm644 ./README $pkgdir/usr/share/doc/$pkgname/README
}
