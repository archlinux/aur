_npmname=complexity-report
_npmver=2.0.0-alpha
pkgname=complexity-report # All lowercase
pkgver=2.0.0_alpha
pkgrel=1
pkgdesc="Software complexity analysis for JavaScript projects"
arch=(any)
url="https://github.com/jared-stilwell/complexity-report"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(9f3b01e470b0ba11cca4726b42eb7f21aa043b1c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
