# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.1
pkgrel=2
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/haskell-godaddy-exe.zip.linux.zip)
sha512sums=('b0c0367bf47121d3b77ea4514d6b5405c8f3e92a78747bea732022a6dd0c248cd8d3f3fcf58e525443183516bd24e7de75e18251cfe93dc39dad3e29c2f234e9')

package() {
  install -Dm0755 haskell-godaddy-exe "$pkgdir"/usr/bin/godaddy
}
