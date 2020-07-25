# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.1.0
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.*}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('8ba215bfccc658ff360ca9068097fbb0f670e1978acea9d15d97fec7a46bb8bb')

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/thrive"
}
