# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.41.3
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('b3cd4c535ae0c4d0bb9a3d57d587f2648ee116e968ef9f70abb3346a49fbb2d1')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



