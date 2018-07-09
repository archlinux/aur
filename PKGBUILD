_npmname=textlint-plugin-review
_npmver=0.3.3
pkgname=textlint-plugin-review # All lowercase
pkgver=0.3.3
pkgrel=1
pkgdesc="textlint Re:VIEW processsor plugin."
arch=(any)
url="https://github.com/orangain/textlint-plugin-review"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(7575aeb562fcdf7597e14f55230b805cec735eb8)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
