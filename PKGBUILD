# Maintainer: Dániel Kántor <aur@daniel-kantor.com>
_npmname=emuto-cli
_npmver=1.8.0
pkgname=emuto # All lowercase
pkgver=1.8.0
pkgrel=1
pkgdesc="transform data files"
arch=(any)
url="https://github.com/kantord/emuto-cli"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(a551b69e76533064e9549a8e4599f5d0ab1cd001)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
