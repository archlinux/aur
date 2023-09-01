# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=1.38.1
pkgrel=1
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('unknown')
depends=(libxtst nss mesa alsa-lib mesa)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-${pkgver}.deb")
sha256sums=('fa6fae14967809efc618d3c6a5bbe4b8d06c68cbaa1d6755f904c35974d84fc3')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}



