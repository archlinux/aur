# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats
pkgname=nodejs-git-stats
pkgver=2.10.11
pkgrel=1
pkgdesc="A GitHub-like contributions calendar, but locally, with all your git commits."
arch=('any')
url="https://github.com/IonicaBizau/git-stats"
depends=('npm')
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
sha256sums=('bff19d489df9098b680d69f94ca67d1d55b7ec0bce31c6e70d740ca122408242')
# vim:set ts=2 sw=2 et:
