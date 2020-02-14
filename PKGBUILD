# Maintainer: neodarz <neodarz@neodarz.net>

_npmname=git-stats-html
pkgname=nodejs-git-stats-html
pkgver=1.0.8
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
sha512sums=('a6e6c5ab9aa4fbe1293a85c0c70a4fbf704dfa70a7555d06dd364044288a7774bbf61bc4f7c07ab9a5317a27506e1214d88f20a2785b3b736439edb47edcf7f5')
# vim:set ts=2 sw=2 et:
