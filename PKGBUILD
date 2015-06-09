# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-cleaver
_npmname=cleaver
pkgver=0.7.4
pkgrel=1
pkgdesc="Generate Markdown presentations and slideshows in record time"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/jdan/cleaver"
license=('MIT')
provides=('cleaver' 'nodejs-cleaver')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
