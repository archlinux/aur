# Maintainer: Kaan Genç <SeriousBug at gmail dot com>

_npmname=grunt-purescript
pkgname=nodejs-$_npmname
pkgver=0.6.0
pkgrel=1
pkgdesc='Compile PureScript files.'
arch=('any')
url='https://github.com/purescript/grunt-purescript'
license=('MIT')
depends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('088b7de323c1416bb0f8519386bd37e4')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
