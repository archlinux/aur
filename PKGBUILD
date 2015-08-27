_npmname=doctoc
_npmver=0.15.0
pkgname=nodejs-doctoc # All lowercase
pkgver=0.15.0
pkgrel=1
pkgdesc="Generates TOC for markdown files of local git repo."
arch=(any)
url="https://github.com/thlorenz/doctoc"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0a7a48e437a0efa98728a430ada124dd95039c0b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
