# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.66.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('6f7d9bde24d81dfbef52c0b91e11ae87e6a4228b3b7c0d125570b6768ceee74a')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



