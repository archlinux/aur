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
sha256sums=('d1312f133909abddb3b507e8445199770f6c454c1e809abe45655fc0fe1b863f')
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 mongosh $pkgdir/usr/bin/mongosh
}
