_npmname=pouchdb-dump-cli
pkgname=nodejs-$_npmname
pkgver=2.0.6
pkgrel=1
pkgdesc="Command-line tool for dumping a CouchDB/PouchDB database to a file"
arch=(any)
url="https://github.com/nolanlawson/pouchdb-dump-cli"
license=('Apache')
depends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('69e9e74623d4357f8a932d0b5f79efd029df25a7915114479a8e300996db6186')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
