_npmname=textlint-plugin-html
_npmver=0.1.7
pkgname=textlint-plugin-html # All lowercase
pkgver=0.1.7
pkgrel=1
pkgdesc="textlint HTML processsor plugin."
arch=(any)
url="https://github.com/textlint/textlint-plugin-html"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(acb90a9b8edcc013cf48b491b2a90d60321a23cf)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
