# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats
pkgname=nodejs-git-stats
pkgver=1.3.0
pkgrel=1
pkgdesc="A GitHub-like contributions calendar, but locally, with all your git commits."
arch=('any')
url="https://github.com/IonicaBizau/git-stats"
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
sha256sums=('b6a59c5546c0f24c4b00bbb8d86a660bb9c162b8f040683760f0920c26435a22')
# vim:set ts=2 sw=2 et:
