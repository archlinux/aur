# Maintainer: Hugues Chabot <at google mail>
_npmname=selenium-standalone
_npmver=6.15.1
pkgname=nodejs-selenium-standalone # All lowercase
pkgver=6.15.1
pkgrel=1
pkgdesc="installs a `selenium-standalone` command line to install and start a standalone selenium server"
arch=(any)
url="https://github.com/vvo/selenium-standalone"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(4b99241445034d0c652eb5a645da46788adc8274)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
