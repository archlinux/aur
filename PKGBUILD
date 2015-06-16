# Maintainer: jnbek <jnbek1972 _AT_ google's mail service __DOT__ com>

_npmname=calipso
pkgname=nodejs-calipso # All lowercase
pkgver=0.3.54
pkgrel=1
pkgdesc="A NodeJS CMS"
arch=(any)
license=('MIT')
url="http://calip.so"
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('c1af28b828645d68e0650302535d51de')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
