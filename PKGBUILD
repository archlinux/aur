# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.38.0
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('5211709cc150c96e572c0b75ed8fe3d5e205c42e7e07a4b1d246ea8bff2d7611')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



