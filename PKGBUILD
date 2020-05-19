# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.0.0
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.*}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('4616050be7907cde6ccb6f9699a720a763ee1c61958fe2c61c560d0f936ef63f')

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/thrive"
}
