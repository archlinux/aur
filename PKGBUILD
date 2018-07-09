_npmname=textlint-rule-rousseau
_npmver=1.4.5
pkgname=textlint-rule-rousseau # All lowercase
pkgver=1.4.5
pkgrel=1
pkgdesc="textlint rule check english sentence using rousseau"
arch=(any)
url="https://github.com/azu/textlint-rule-rousseau"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(5cc8b2fe1124413bd82b3d0b21778892db42a3ac)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
