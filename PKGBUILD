# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.57.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('93c71f96fcd9f38f9ba7d4966df79f1dd0c0f2642c9c55be699977ad0f6374b2')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



