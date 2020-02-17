# Maintainer: Fabius
_npmname=wiki-cli
_npmver=0.0.4
pkgname=nodejs-wiki-cli
pkgver=0.0.4
pkgrel=1
pkgdesc="Search Wikipedia and read summaries directly in your terminal!"
arch=(any)
url="https://github.com/hexrcs/wiki-cli"
license=('GPL3')
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(6564b788d8bcfe1b7de6902ea346ce264e9532cd998e6adce136c6b9aa3c3201)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
