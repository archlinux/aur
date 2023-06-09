# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.34.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('c9fdd24b5f8f284fef8e5e8f0b442e30eb69bbbbc6778ee3ff16a63b70c64811')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


