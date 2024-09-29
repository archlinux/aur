# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.70.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('10951ee09e64f99f70d1405520c37d780117d3cd489516e7112f9b9ea36e49e1')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



