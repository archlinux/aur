# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.7.2
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('569db464b8a2931fe4a2284a33a59c2d340a7088b9ed9261e7f8e7787882a000')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



