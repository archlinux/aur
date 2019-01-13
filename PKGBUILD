# Maintainer: neodarz <neodarz@neodarz.net>

_npmname=git-stats-html
pkgname=nodejs-git-stats-html
pkgver=1.0.7
pkgrel=1
pkgdesc="Turn git-stats result into HTML output. "
arch=('any')
url="https://github.com/IonicaBizau/git-stats-html"
depends=('npm')
depends=('nodejs')
license=('MIT')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha512sums=('cf2d59d3fdb6c53242def456ea0d64577efa3072ab370eb28276f77e2f81d46994808da6fd48cb84aa1b7d480036b0ebf4ecafc4dcec2588e93332372a03975f')
# vim:set ts=2 sw=2 et:
