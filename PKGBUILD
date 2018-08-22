# Maintainer: neodarz <neodarz@neodarz.net>

_npmname=git-stats-html
pkgname=nodejs-git-stats-html
pkgver=1.0.6
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
sha256sums=('aa8b2245b2151481d02ba06586dec01ce5cb09c9e1b708e41f33121a417e5b46')
# vim:set ts=2 sw=2 et:
