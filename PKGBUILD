# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
_npmname=tern
_npmver=0.24.2
pkgname=nodejs-tern # All lowercase
pkgver=0.24.2
pkgrel=1
pkgdesc="A JavaScript code analyzer for deep, cross-editor language support"
arch=(any)
url='http://ternjs.net/'
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('a55261669d6fbefd9ec203efe98c0db32094f82a2625d1c1b536a30e8fc475f18763608b090e77b9c802cef59f171f8a5e5b341fab11c270cc63c428f9a42f8b')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
                                                                                                                                                                                                          
                                                                                                                                                                                                        

