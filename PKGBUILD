# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
_npmname=git-stats-importer
pkgname=nodejs-git-stats-importer
pkgver=1.5.0
pkgrel=1
pkgdesc="Imports your commits from a repository into git-stats history."
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
sha256sums=('1989fdd2162094fe0d95a6ac11016d4acc274be673757b0c8a3bc45f3d0a16b1')
# vim:set ts=2 sw=2 et:
