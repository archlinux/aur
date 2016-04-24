_npmname=gitbook-cli
_npmver=2.1.3
pkgname=nodejs-gitbook-cli # All lowercase
pkgver=2.1.3
pkgrel=1
pkgdesc="CLI to generate books and documentation using gitbook"
arch=(any)
url="https://www.gitbook.com"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(daf190535d43de8322e91255fa25c5ad02a20bf4)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
