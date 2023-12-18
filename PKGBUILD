# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.44.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('0bd5f8238ebb819d96cd3332b7c3b8c4177eb59ac611ab26c299494fac1bfa25')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



