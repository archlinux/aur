_npmname=@relaypro/cli
_npmver=0.1.1
pkgname=nodejs-relaypro-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Relay developer CLI"
arch=(any)
url="https://github.com/relaypro/relay-cli"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/cli-$_npmver.tgz)
noextract=(cli-$_npmver.tgz)
sha1sums=(ae7c7d6317f448f705512579bf5b3fa2015b8f58)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
