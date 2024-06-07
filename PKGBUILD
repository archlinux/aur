# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.61.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('3d55428f1e80722e16f7d45b8d5dd7e5cd3c00e97e1c27325e8a9e437cc0879e')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



