# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.2
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip)
sha512sums=('84714626498fc41ebc01fcbb522149032324c93e44cc8300d1bdb2f68aef19468a8ff9c9d5554c834ea0073a430125ddd3da2ecaa240621510bc9a0395b2b3b4')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
}
