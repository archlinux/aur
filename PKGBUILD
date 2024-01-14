# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.44.3
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('6d0be5c013b788c9fcda8c5476315af69ae5af9e3a8b4f0efedcc9843a87bf5d')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



