# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats
pkgname=nodejs-git-stats
pkgver=1.6.0
pkgrel=1
pkgdesc="A GitHub-like contributions calendar, but locally, with all your git commits."
arch=('any')
url="https://github.com/IonicaBizau/git-stats"
depends=('npm')
depends=('nodejs')
license=('MIT')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
sha256sums=('488f82f7857ef863dcf8a92ae942a1debffc57825e064ce8a81ecef7cdf785fd')
# vim:set ts=2 sw=2 et:
