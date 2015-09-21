# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats-importer
pkgname=nodejs-git-stats-importer
pkgver=2.0.0
pkgrel=1
pkgdesc="Imports your commits from a repository into git-stats history."
arch=('any')
url="https://github.com/IonicaBizau/git-stats"
depends=('nodejs')
license=('KINDLY')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha256sums=('7632825dcde5641440bcdcab7029c42db4e700367b8c3dd8cca4d1079e368b27')
# vim:set ts=2 sw=2 et:
