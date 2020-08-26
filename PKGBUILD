# Maintainer: neodarz <neodarz@neodarz.net>

_npmname=git-stats-html
pkgname=nodejs-git-stats-html
pkgver=1.0.9
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
sha512sums=('c3991c8d5489bcf59003ffbc082a5f40ac9223215e8270932194705e3b130ca4cba3026a19ba49102ec23a6dbd77f4839129ae11aec4745f5f9ca7b63e327207')
# vim:set ts=2 sw=2 et:
