# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.3
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip)
sha512sums=('8bc67940cf9f8bc86526c67230bf1af3204d3dedf44cdc59164b7b91e854d25da4c25baeb7307fd387da2b27b01f17a3aea77d6ca46b7049a035f55a961d766f')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
}
