# Maintainer: Tobias Brunner <tobias@tobru.ch>

_npmname=cloudron
_npmver=0.42.0
pkgname=cloudron-cli # All lowercase
pkgver=0.42.0
pkgrel=1
pkgdesc="Cloudron Commandline Tool"
arch=(any)
url="https://git.cloudron.io/cloudron/cloudron-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0b7d163f0b1d2577b41ad4b230bd88651796bf74)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
