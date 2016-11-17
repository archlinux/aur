# Maintainer: Gregory Scheerlinck <gregory dot scheerlinck at gmail dot com>
_npmname=arch-wiki-man
_npmver=1.3.0
pkgname=arch-wiki-man # All lowercase
pkgver=1.3.0
pkgrel=1
pkgdesc="The Arch Wiki as linux man pages"
arch=(any)
url="https://github.com/greg-js/arch-wiki-man#readme"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(5d12b7248a80d15e1fd4bc71405cc0d65ba38aad)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
