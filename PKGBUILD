# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-gitmoji
_npmver=0.0.7
pkgname=nodejs-cz-gitmoji
pkgver=0.0.7
pkgrel=1
pkgdesc="Commitizen plugin to use gitmojis in your commits"
arch=(any)
url="https://github.com/Landish/cz-gitmoji"
license=(MIT)
depends=('nodejs' 'npm' 'nodejs-commitizen')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('4cffa8fd239802608a7809890050070a89831e41e4ecf77185d12aa2dde97eea8f9b4297c3c21ebe34658f74253e0230ef8559ec2d609cd28a90a635e5075376')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:<Paste>
