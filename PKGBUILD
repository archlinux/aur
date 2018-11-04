_npmname=interactive-diff-patch
_npmver=0.0.3
pkgname=interactive-diff-patch # All lowercase
pkgver=0.0.3
pkgrel=1
pkgdesc="Allows you to apply diff hunks one at a time and preview them on the command line. Requires diff and patch which are included with git."
arch=(any)
url="https://gitlab.com/bixfliz/interactive-diff-patch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(91ba80556a48691277015d3f22f591e1486196d6)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
