# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
_npmname=tern
_npmver=0.15.0
pkgname=nodejs-tern # All lowercase
pkgver=0.15.0
pkgrel=1
pkgdesc="A JavaScript code analyzer for deep, cross-editor language support"
arch=(any)
url='http://ternjs.net/'
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('682762384c09b110545ab9101e1977ff28ef7c15')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
                                                                                                                                                                                                          
                                                                                                                                                                                                        
