# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.5
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(
    https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip
	https://raw.githubusercontent.com/ibizaman/haskell-godaddy/0.0.0.5/bin/godaddy-certbot-dns01-auth-hook
	https://raw.githubusercontent.com/ibizaman/haskell-godaddy/0.0.0.5/bin/godaddy-certbot-dns01-cleanup-hook
)
sha512sums=('c553ecaaaea5944f54a7581786d1bf8668019423b74aab2f2b47475be4bc917110b80bc0e07a23f506498ef12e3612007e17fac9a245d8c64535547afb8dc35d'
            '5a07f6ca526ee01e9e242da02710fa1e357f47edeb826d87f099a258e681c3f8d3e27cefe89e5ea104b8e36bd69fe3bb0f1b036f16715387e9078a56d860a952'
            'e65071ac1645f6b84b00ea7a50f659efe6f08dbe619e6784901da825a7798c0d1c69c890a93682f3f79884387cd32d4da0ed02f16d68fc8d30ce989921ce06c5')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
}
