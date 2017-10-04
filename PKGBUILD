_npmname=git-run
_npmver=0.5.5
pkgname=gr
pkgver=0.5.5
pkgrel=1
pkgdesc="A tool for managing multiple git repositories"
arch=(any)
url="http://mixu.net/gr/"
license=('BSD')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
sha1sums=('7d3f079dd14749fd2e8ea82204043e690ffe5e26')
sha256sums=('27e1330e45494e90e93f7ae3ee0d3b0c13b551740f03ec0e72f916692bd97ffc')
