# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.60.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('7b00b43d1e0a462c492349b47c4c03a02b8698d4bed5199cf85e995ffbbe4c7c')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



