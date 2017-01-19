#Maintainer: Simon Legner <Simon.Legner@gmail.com>
_npmname=svgclean
_npmver=0.2.9
pkgname=svgclean
pkgver=0.2.9
pkgrel=1
pkgdesc="Removes useless tags from exported svg files"
arch=(any)
url="https://github.com/HiroAgustin/svgclean"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0a6b7ccfe3b9f03c4641d9eb8c95d984417fbd3c)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
