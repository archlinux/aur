# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats
pkgname=nodejs-git-stats
pkgver=2.10.9
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
sha256sums=('242bf96cc095968c01f889df64b312fcf6a187e1a77f60763348448046ad93fe')
# vim:set ts=2 sw=2 et:
