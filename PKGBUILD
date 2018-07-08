_npmname=dockerfile_lint
_npmver=0.3.2
pkgname=dockerfile_lint # All lowercase
pkgver=0.3.2
pkgrel=1
pkgdesc="Utility for linting a docker file against accepted good practices"
arch=(any)
url="https://github.com/projectatomic/dockerfile_lint#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(8f702d4b8cf2643b567204f3e80d6febed677009)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
