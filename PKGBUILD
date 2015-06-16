# Author: Filirom1 <filirom1@gmail.com>
# Maintainer: filirom1 <filirom1@gmail.com>
_npmname=aws-lib
_npmver=0.3.0
pkgname=nodejs-aws-lib # All lowercase
pkgver=0.3.0
pkgrel=1
pkgdesc="Extensible Node.js library for the Amazon Web Services API"
arch=(any)
url="https://github.com/livelycode/aws-lib"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=("213c04bb357a7c6764bc099f58cb6336a957d198")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
