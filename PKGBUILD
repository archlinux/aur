# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=thrive
pkgver=0.5.1.1
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond."
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
source=("https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver%.0}/Thrive_${pkgver}_linux_x11.7z")
sha256sums=('89a38efe9a2842141d5fb9af48c8023cd441c2e1d749546a4f7d7fcf8e5f18b5')

package() {
  install -dm755 --group games "$pkgdir/opt/thrive"
  cp -r "Thrive_${pkgver}_linux_x11"/* "$pkgdir/opt/thrive"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/thrive"
}
