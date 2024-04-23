# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.56.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('d99339eb808af66fa8af8ce3f19f9eb004c80a57fee8f7b94bd945a6d56f0bad')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



