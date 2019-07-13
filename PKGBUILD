# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.14.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("butler.sh" 
        "https://broth.itch.ovh/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('139d933a14939a6822cee27294aac9730d45d81dc7257d5dcd8a5f46913492a1'
            '98a08b1f310a0078e8e4917a095df9c5d41fd261e6520fd0316dccdac246ba2f')

package() {
  install -Dm755 butler.sh "$pkgdir/usr/bin/butler"
  install -Dm755 butler -t "$pkgdir/usr/lib/butler"
  install -Dm755 *.so -t "$pkgdir/usr/lib/butler"
}
