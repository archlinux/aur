# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-markdown-live
_npmname=markdown-live
pkgver=1.0.8
pkgrel=1
pkgdesc="Markdown preview with live update"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/mobily/markdown-live"
license=('MIT')
provides=('mdlive' 'nodejs-markdown-live')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
