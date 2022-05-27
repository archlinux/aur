# Maintainer: Aaron Coach <aur at ezpz dot cz>

_npmname=passport-saml
_npmver=3.2.1
pkgname=nodejs-passport-saml
pkgver=3.2.1
pkgrel=1
pkgdesc="SAML 2.0 authentication with passport"
arch=(any)
url="https://github.com/node-saml/passport-saml"
license=(MIT)
makedepends=('npm')
depends=('nodejs<18.1.0' 'nodejs-passport=0.5.3')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('1dff35e54dca44ea0dc02a8f6446f8eda04138509bb93eb9227b43cd37e9eb77')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
