# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=jasmine-runner
pkgname=nodejs-jasmine-runner # All lowercase
pkgver=0.2.9
pkgrel=1
pkgdesc="Jasmine BDD utility tool and commandline runner"
arch=(any)
url="http://github.com/jamescarr/jasmine-tool"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('2e21efc4529bf9ca7ec1564295c8e870a20ed623')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
# vim:set ts=2 sw=2 et:
