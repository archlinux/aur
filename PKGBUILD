# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.46
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('07606a5d5665b9c9af55fd8596df3e11aae3d7cce83ca601e1e416be21d142f3')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



