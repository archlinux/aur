# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.0.5
pkgrel=1
pkgdesc='The MongoDB Shell is a fully functional JavaScript environment for interacting with MongoDB deployments having syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('custom')
depends=('mongodb-bin')
provides=("mongosh=$pkgver")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux.tgz")
sha256sums=('f0fc64377307a7d0cf8af27b39acd058e8e942d353b706d4561a5ff832cdc785')
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 mongosh $pkgdir/usr/bin/mongosh
}
