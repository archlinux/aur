# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.34.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('4a764d8cfcb24526d02b0cd9c6954f9086a9417b6f99e2b9bea2a19c260a3a6b')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}


