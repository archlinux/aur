# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
_npmname=tern
_npmver=0.17.0
pkgname=nodejs-tern # All lowercase
pkgver=0.17.0
pkgrel=1
pkgdesc="A JavaScript code analyzer for deep, cross-editor language support"
arch=(any)
url='http://ternjs.net/'
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('f643a16eb494151f03c3ba553590fd3bd669bb87')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}
                                                                                                                                                                                                          
                                                                                                                                                                                                        
