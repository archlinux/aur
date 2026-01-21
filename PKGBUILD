# Maintainer: cogumelo@tutamail.com

pkgname=waydroid-dinit
pkgver=1.0
pkgrel=1
pkgdesc="Waydroid Container Manager as an Dinit service"
arch=('any')
url='https://waydro.id'
license=('GPL3')
depends=('dinit' 'waydroid')
source=("waydroid-container")
sha256sums=("638cb5c7e428ea008beb28ca11bbf0318cbee61c7ad5d269806d062d1b6cd263")

package() {
  install -Dm755 waydroid-container "$pkgdir"/etc/dinit.d/waydroid-container
}
