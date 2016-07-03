# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
_npmver=3.4.2
pkgname=nodejs-generator-jhipster
pkgver=3.4.2
pkgrel=1
pkgdesc="JHipster is a fully Open Source, widely used application generator. Easily create high-quality Spring Boot + AngularJS projects!"
arch=(any)
url="https://jhipster.github.io/"
license=(Apache)
depends=('nodejs-yeoman' 'bower' 'gulp')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('46126ddc6f74b0fedde75d6c5c894750b75146db')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
