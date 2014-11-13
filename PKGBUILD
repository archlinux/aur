_npmname=termcolors
pkgname=nodejs-termcolors
pkgver=0.2.10
pkgrel=1
pkgdesc="Convert terminal color schemes"
arch=(any)
url="https://github.com/stayradiated/termcolors"
license=(MIT)
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('c4f07d75e708c30c3b2a2a3807cba69795697607')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
