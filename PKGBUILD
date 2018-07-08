_npmname=remark-lint
_npmver=6.0.2
pkgname=remark-lint # All lowercase
pkgver=6.0.2
pkgrel=1
pkgdesc="Lint markdown with remark"
arch=(any)
url="https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(f4ac45536e4fbf3c9a523dfa1cca874c598554de)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
