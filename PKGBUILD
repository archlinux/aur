# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.33.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-1.33.0.deb")
sha256sums=('2388ef8b3c8959a7b6fa527a67e745fc851e0d7bc2005c517758ceaf6decc0c7')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


