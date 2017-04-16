# Maintainer: John D Jones III < jnbek1972 _+-^_AT_^-+_ gmail /|\-_-+_DOT_+-_-\|/ com

_npmname=generator-scala-app
_npmver=0.1.2
pkgname=nodejs-generator-scala-app # All lowercase
pkgver=0.1.2
pkgrel=1
pkgdesc="Yeoman Generator for Scala/SBT projects"
arch=(any)
url="https://github.com/nikolaylagutko/generator-scala-app"
license=('MIT')
depends=('npm' 'nodejs-yeoman')
optdepends=(
  'scala: Scala Programming Language'
  'sbt: Scala Build Tool'
)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('b855eb29f9f097c58566ad05a77f80fadd59d824')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
