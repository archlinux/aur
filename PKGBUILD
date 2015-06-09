# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-react-tools
_npmname=react-tools
pkgver=0.13.3
pkgrel=1
pkgdesc="A set of complementary tools to React, including the JSX transformer"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/facebook/react"
license=('BSD3')
provides=('jsx' 'nodejs-react-tools')
conflicts=('jsx')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
