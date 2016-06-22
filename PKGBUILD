# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=mgp
_npmver=1.3.0
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Install private Meteor packages"
arch=(any)
url="http://github.com/DispatchMe/mgp"
license=('MIT')
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha1sums=('e885ff32856652b3f489cc4976e61d6c1ebcffcf')

package() {
  cd "$srcdir/package"
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
