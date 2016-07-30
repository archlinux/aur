# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
_npmver=3.5.1
pkgname=nodejs-generator-jhipster
pkgver=3.5.1
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=(any)
url="https://jhipster.github.io/"
license=(Apache)
depends=('nodejs-yeoman' 'bower' 'gulp')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('17af15b5e69c28c7081e33a6ca201075de23f479')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
