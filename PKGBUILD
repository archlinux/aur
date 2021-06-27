# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
_npmname=tern
_npmver=0.24.3
pkgname=nodejs-tern # All lowercase
pkgver=0.24.3
pkgrel=2
pkgdesc="A JavaScript code analyzer for deep, cross-editor language support"
arch=(any)
url='http://ternjs.net/'
license=('MIT')
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('67cbafb5d5889459f5196cb41d6e45859f150ebc99c282547678d9536e42eff3c13a5b4b227d6ebfe585deb56ae92d7beb561bb266d96113ff97464904292faf')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  # npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "${pkgdir}"
}
                                                                                                                                                                                                          
                                                                                                                                                                                                        

