_npmname=textlint-rule-no-dead-link
_npmver=4.3.0
pkgname=textlint-rule-no-dead-link # All lowercase
pkgver=4.3.0
pkgrel=1
pkgdesc="A textlint rule to check if all links are alive"
arch=(any)
url="https://github.com/textlint-rule/textlint-rule-no-dead-link"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(c6898709e484a6eabc82f0b3a02bc7cd2c64c490)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
