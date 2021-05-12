# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.21.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("butler.sh" 
        "https://broth.itch.ovh/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('139d933a14939a6822cee27294aac9730d45d81dc7257d5dcd8a5f46913492a1'
            'b640fceade5cafc7601b0ee57ba13c85913917eb5440375f7a605126f9ca2e1c')

package() {
  install -Dm755 butler.sh "$pkgdir/usr/bin/butler"
  install -Dm755 butler -t "$pkgdir/usr/lib/butler"
  install -Dm755 *.so -t "$pkgdir/usr/lib/butler"
}
